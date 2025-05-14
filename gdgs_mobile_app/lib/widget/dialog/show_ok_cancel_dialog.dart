import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShowOkCancelDialog {
  static Future<String?> showTextInputDialog(BuildContext context) async {
    // TextField의 내용을 제어하기 위한 컨트롤러
    final TextEditingController textFieldController = TextEditingController();
    String? result;
    print("음식 필터링 다이얼로그 >> 시작");
    // showDialog는 Future를 반환하며, 다이얼로그가 닫힐 때 값을 전달받을 수 있습니다.
    result = await showDialog<String?>(
      context: context,
      // barrierDismissible: false, // 다이얼로그 바깥을 탭해도 닫히지 않게 하려면 true로 설정
      builder: (BuildContext dialogContext) {
        // 다이얼로그 내부의 context
        return AlertDialog(
          title: const Text('텍스트 입력'),
          content: TextField(
            controller: textFieldController, // 컨트롤러 연결
            decoration: const InputDecoration(hintText: "여기에 내용을 입력하세요."),
            autofocus: true, // 다이얼로그가 열리면 자동으로 포커스
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('취소'),
              onPressed: () {
                print("음식 필터링 다이얼로그 >> 취소");

                dialogContext.pop(); // 다이얼로그를 닫고 아무 값도 반환하지 않음 (null 반환)
              },
            ),
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                final userInputText = textFieldController.text;
                // TextField의 현재 텍스트를 가지고 다이얼로그를 닫음
                textFieldController.dispose();
                dialogContext.pop(userInputText);
                print("음식 필터링 다이얼로그 >> 확인 => $userInputText");
              },
            ),
          ],
        );
      },
    );

    print("음식 필터링 다이얼로그 >> 끝 => $result");
    return result; // 사용자가 입력한 텍스트 또는 null 반환
  }
}
