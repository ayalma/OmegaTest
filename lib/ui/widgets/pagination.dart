
import 'package:flutter/material.dart';
import 'package:omega_evaluation_project/commons/resource.dart';
import 'package:omega_evaluation_project/ui/widgets/loading_view.dart';
import 'package:omega_evaluation_project/ui/widgets/on_widget_did_build.dart';

typedef OnLoadMore = Function();
typedef OnWidgetBuilder<T> = Widget Function(T);

class Pagination<T> extends StatelessWidget with OnWidgetBuildMixin {
  final ScrollController controller;
  final Stream<Resource<List<T>>> stream;
  final Stream<NetworkState> networkState;
  final Widget child;
  final Widget noItemView;
  final OnLoadMore onLoadMore;
  final OnWidgetBuilder<T> onWidgetBuilder;
  final RefreshCallback onRefresh;
  final VoidCallback onRetry;

  const Pagination({
    Key key,
    this.stream,
    this.child,
    this.onLoadMore,
    this.onWidgetBuilder,
    this.noItemView,
    this.networkState,
    this.onRefresh,
    this.onRetry,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Resource<List<T>>>(
      stream: stream,
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final resource = snapshot.data;
          switch (resource.status) {
            case Status.Loading:
              return Center(child: CircularProgressIndicator());
            case Status.Error:
              return LayoutBuilder(
                builder: (_, constraint) => RefreshIndicator(
                  onRefresh: onRefresh,
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraint.maxHeight,
                      ),
                      child: LoadingView(
                        error: resource.message,
                        onPressed: onRetry,
                      ),
                    ),
                  ),
                ),
              );
            case Status.Success:
              final items = resource.data;
              if (items.length == 0) {
                return LayoutBuilder(
                  builder: (_, constraint) => RefreshIndicator(
                    onRefresh: onRefresh,
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraint.maxHeight,
                        ),
                        child: noItemView,
                      ),
                    ),
                  ),
                );
              }
              if (controller != null) {
                onWidgetDidBuild(
                  () => controller.animateTo(
                    controller.position.maxScrollExtent,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.ease,
                  ),
                );
              }
              return RefreshIndicator(
                onRefresh: onRefresh,
                child: ListView.builder(
                  controller: controller,
                  itemBuilder: (context, index) {
                    return (index < items.length)
                        ? onWidgetBuilder(items[index])
                        : Center(
                            child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: StreamBuilder<NetworkState>(
                              builder: (context, item) {
                                if (item.hasData && item.data != null) {
                                  final networkStatusResource = item.data;

                                  if (networkStatusResource.loadMore) {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      onLoadMore();
                                    });
                                    return Container();
                                  }

                                  switch (networkStatusResource.status) {
                                    case Status.Loading:
                                      return CircularProgressIndicator();
                                    case Status.Error:
                                      return LoadingView(
                                        onPressed: () {
                                          onLoadMore();
                                        },
                                        error: networkStatusResource.message,
                                      );
                                    case Status.Success:
                                      return Container();
                                    default:
                                      return Container();
                                  }
                                } else {
                                  return Container();
                                }
                              },
                              stream: networkState,
                            ),
                          ));
                  },
                  itemCount: resource.data.length + 1,
                ),
              );
            default:
              return Container();
          }
        }
        return Container();
      },
    );
  }
}
