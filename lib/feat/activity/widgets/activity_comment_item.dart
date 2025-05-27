import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:nba_sdk/feat/activity_detail/cubit/activity_details_cubit.dart';
import 'package:nba_sdk/feat/activity_detail/repository/models/comment_item_model.dart';
import 'package:nba_sdk/feat/core/theme/nba_theme.dart';
import 'package:nba_sdk/feat/core/web_view/in_app_web_view.dart';

class ActivityCommentItem extends StatelessWidget {
  const ActivityCommentItem({
    super.key,
    required this.comment,
    required this.showDeleteButton,
    required this.onDelete,
    required this.onUpdate,
  });

  final CommentItemModel comment;
  final bool showDeleteButton;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'You',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              const SizedBox(height: 4),
              Text(
                comment.createdAt ?? '',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 12,
                ),
              ),
              PopupMenuButton<String>(
                color: NbaTheme.grayFour,
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white.withOpacity(0.5),
                ),
                onSelected: (value) {
                  if (value == 'update') {
                    onUpdate();
                  } else if (value == 'delete') {
                    onDelete();
                  }
                },
                itemBuilder:
                    (BuildContext context) => <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'update',
                        child: Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'delete',
                        child: Text(
                          'Delete',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
              ),
            ],
          ),
          //const SizedBox(height: 4),
          Text(
            comment.content ?? '',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
            ),
          ),

          for (var attachment in comment.attachments ?? [])
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: AttachmentItem(
                fileName: attachment.fileName,
                fileUrl: attachment.fileUrl,
                onUpdateAttachment: () {
                  context.read<ActivityDetailsCubit>().updateCommentAttachment(
                    attachment.id.toString(),
                    comment.id.toString(),
                    comment.taskId.toString(),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class AttachmentItem extends StatelessWidget {
  const AttachmentItem({
    super.key,
    required this.fileName,
    required this.fileUrl,
    required this.onUpdateAttachment,
  });

  final String fileName;
  final String fileUrl;
  final Function() onUpdateAttachment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: NbaTheme.grayThree,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/preview.svg', width: 24, height: 24, package: 'nba_sdk'),
          Gap(5),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            InAppWebViewScreen(url: fileUrl, title: fileName),
                  ),
                );
              },
              child: Text(
                fileName,
                style: TextStyle(color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Gap(5),
          GestureDetector(
            onTap: onUpdateAttachment,
            child: SvgPicture.asset('assets/icons/delete.svg', width: 18, height: 18, package: 'nba_sdk',
            )
          ),
        ],
      ),
    );
  }
}
