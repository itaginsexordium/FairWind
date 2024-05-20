import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fairwind/src/common/common.dart';
import 'square_progress_indicator.dart';
import 'package:l/l.dart';

class LoaderScope extends StatefulWidget {
  const LoaderScope({
    required this.child,
    super.key,
  });

  static void showLoaderOf<T extends Object?>(
    BuildContext context, {
    required Future<T> future,
  }) {
    final state = context.findAncestorStateOfType<_LoaderScopeState>();

    if (state == null) {
      l.e("DLSLoaderScope: couldn't find DLSLoaderScope in context");
      return;
    }

    state._queue.add(future);
  }

  final Widget child;

  @override
  State<LoaderScope> createState() => _LoaderScopeState();
}

class _LoaderScopeState extends State<LoaderScope> {
  bool _showLoader = false;
  FocusNode? _lastFocusedNode;

  late final _queue = FutureQueue(onUpdate: _onUpdateQueueState);

  void _onUpdateQueueState(bool value) {
    setState(() {
      _showLoader = value;
      if (value) {
        final scope = FocusScope.of(context);
        _lastFocusedNode = scope.focusedChild;
        _lastFocusedNode?.unfocus();
      } else {
        _lastFocusedNode?.requestFocus();
        _lastFocusedNode = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        widget.child,
        if (_showLoader)
          Positioned.fill(
            child: ColoredBox(
              color: theme.scaffoldBackgroundColor.withOpacity(0.7),
              child: const Center(
                child: SquareProgressIndicator(),
              ),
            ),
          ),
      ],
    );
  }
}
