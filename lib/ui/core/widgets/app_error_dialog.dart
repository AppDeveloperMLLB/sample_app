import 'package:flutter/material.dart';

Future<void> openDialog({
  required BuildContext context,
  required String title,
  required String subTitle,
  Function()? onTapOk,
}) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                subTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      elevation: 5,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () => Navigator.of(dialogContext).pop(),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 18,
                      ),
                      child: Text(
                        'いいえ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      elevation: 5,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                      onTapOk?.call();
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 18,
                      ),
                      child: Text(
                        'はい',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      );
    },
  );
}

class RetryDialog extends StatelessWidget {
  const RetryDialog({
    super.key,
    required this.onRetry,
  });
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Text(
                "エラー",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              "再試行しますか？",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    elevation: 5,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 18,
                    ),
                    child: Text(
                      'いいえ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    elevation: 5,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    onRetry.call();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 18,
                    ),
                    child: Text(
                      'はい',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  static Future<void> show(BuildContext context, VoidCallback onRetry) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return RetryDialog(onRetry: onRetry);
      },
    );
  }
}
