import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class NewJournalEntry extends StatelessWidget {
  const NewJournalEntry({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      shape: BeveledRectangleBorder(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(
            30,
          ),
        ),
        side: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
          width: 1,
        ),
      ),
      child: InkWell(
        highlightColor:
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
        splashColor: Theme.of(context).colorScheme.primaryContainer,
        onTap: () => context.go('/journal/new'),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 16,
                ),
                child: VerticalDivider(
                  thickness: 1,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 56,
                    right: 16.0,
                    bottom: 56,
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_box_outlined,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const Gap(8),
                        Text(
                          'NEW ENTRY',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
