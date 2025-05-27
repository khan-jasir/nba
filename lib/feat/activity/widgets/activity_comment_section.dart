import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:nba_sdk/feat/activity/widgets/comment_options.dart';
import 'package:nba_sdk/feat/activity_detail/cubit/activity_details_cubit.dart';
import 'package:nba_sdk/feat/activity_detail/repository/models/comment_item_model.dart';

import 'package:nba_sdk/feat/core/theme/nba_theme.dart';
import 'package:nba_sdk/feat/core/web_view/in_app_web_view.dart';

import 'activity_comment_item.dart';

class ActivityCommentSection extends StatefulWidget {
  const ActivityCommentSection({
    super.key,
    required this.comments,
    required this.taskId,
  });

  final List<CommentItemModel> comments;
  final String taskId;

  @override
  State<ActivityCommentSection> createState() => _ActivityCommentSectionState();
}

class _ActivityCommentSectionState extends State<ActivityCommentSection> {
  TextEditingController _commentController = TextEditingController();

  Future<void> _pickFiles() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.any,
      );

      if (result != null) {
       context.read<ActivityDetailsCubit>().addCommentAttachments(result.files);
      }
    } catch (e) {
      debugPrint('Error picking files: $e');
    }
  }

  Widget _buildAttachmentItem(PlatformFile file, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: NbaTheme.grayThree,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // If file has a path, we can open local file in webview
              if (file.path != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InAppWebViewScreen(
                      url: 'file://${file.path!}',
                      title: file.name,
                    ),
                  ),
                );
              }
            },
            child: SvgPicture.asset('assets/icons/preview.svg', width: 24, height: 24, package: 'nba_sdk'),
          ),
          Gap(5),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // If file has a path, we can open local file in webview
                if (file.path != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InAppWebViewScreen(
                        url: 'file://${file.path!}',
                        title: file.name,
                      ),
                    ),
                  );
                }
              },
              child: Text(
                file.name,
                style: TextStyle(color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Gap(5),
          GestureDetector(
            onTap: () {
              context.read<ActivityDetailsCubit>().removeCommentAttachment(index);
            },
            child: SvgPicture.asset(
              'assets/icons/delete.svg',
              width: 20,
              height: 20,
              package: 'nba_sdk',
            )
          ),
        ],
      ),
    );
  }

  void _showCommentInput([bool isUpdate = false, String? commentId]) {

    final activityDetailsCubit = context.read<ActivityDetailsCubit>();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (bottomSheetContext) => BlocProvider.value(
            value: activityDetailsCubit,
            child: Builder(
              builder: (builderContext) {
                return Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff1B4753),
                    //borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => _pickFiles(),
                                child: SvgPicture.asset(
                                  'assets/icons/attach_file.svg',
                                  width: 24,
                                  height: 24,
                                  package: 'nba_sdk',
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _commentController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Enter comment text...',
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if(isUpdate) {
                                    context.read<ActivityDetailsCubit>().updateComment(_commentController.text, widget.taskId, commentId ?? '');
                                  } else {
                                    context.read<ActivityDetailsCubit>().addComment(_commentController.text, widget.taskId);
                                  }
                                  _commentController.clear();
                                  Navigator.pop(bottomSheetContext);
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/send.svg',
                                  width: 24,
                                  height: 24,
                                  package: 'nba_sdk',
                                ),
                              ),
                            ],
                          ),
                          BlocBuilder<ActivityDetailsCubit, ActivityDetailsState>(
                            builder: (context, state) {
                              if (state.commentAttachments.isNotEmpty) {
                                return Container(
                                  constraints: BoxConstraints(maxHeight: 150),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: state.commentAttachments.length,
                                    itemBuilder:
                                        (context, index) => _buildAttachmentItem(
                                          state.commentAttachments[index],
                                          index,
                                        ),
                                  ),
                                );
                              }
                              return SizedBox.shrink();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             if(widget.comments.isEmpty) ...[
              Text(
                'No comments yet',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
              )
             ] else ...[
              Text(
                '${widget.comments.length} Comments',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
              ),
              // GestureDetector(
              //   onTap: () => _showCommentInput(),
              //   child: Image.asset('assets/icons/add_comment.png', width: 24, height: 24),
              // )
             ]
            ],
          ),
          Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommentOptions(
                commentType: CommentTypes.closingToday,
                onSelected: (type) {
                  _commentController.text = type.value;
                  _showCommentInput();
                },
              ),
              Gap(5),
              CommentOptions(
                commentType: CommentTypes.mightBeDelayed,
                onSelected: (type) {
                  _commentController.text = type.value;
                  _showCommentInput();
                },
              ),
            ],
          ),
          Gap(10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommentOptions(
                commentType: CommentTypes.needCall,
                onSelected: (type) {
                  _commentController.text = type.value;
                  _showCommentInput();
                },
              ),
              Gap(5),
              CommentOptions(
                commentType: CommentTypes.addYourOwn,
                onSelected: (type) {
                  _commentController.text = '';
                  _showCommentInput();
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: widget.comments.length,
            itemBuilder: (context, index) => ActivityCommentItem(
              comment: widget.comments[index],
              showDeleteButton: true,
              onDelete: () {
                final commentId = widget.comments[index].id.toString();
                final taskId = widget.comments[index].taskId.toString();
                context.read<ActivityDetailsCubit>().deleteComment(commentId, taskId);
              },
              onUpdate: () {
                _commentController.text = widget.comments[index].content ?? '';
                _showCommentInput(true, widget.comments[index].id.toString());
              },
            ),

          )
          // ActivityCommentItem(
          //   comment:
          //       'Called Arjun, seemed hesitant to make payment by this week.',
          //   timestamp: 'Today, 2:54 PM',
          //   showDeleteButton: true,
          //   onDelete: () {},
          // ),

          // ActivityCommentItem(
          //   comment: 'Called, Arjun didn\'t pick up',
          //   timestamp: 'Yesterday, 2:01 PM',
          //   showDeleteButton: true,
          //   onDelete: () {},
          // ),
        ],
      ),
    );
  }
}
