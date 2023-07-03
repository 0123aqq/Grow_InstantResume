<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5.[생성된 이력서 화면 jsp 페이지] (HTML로 다운로드 기능 넣어야 함)</title>
</head>
<body>

 5-1+ view 파일에 header,footer import
 5-2+ GRF.css 만들어서 링크 or 이 안에 css코드 넣기

5-3+ GeneratedResumeController에 연결
:생성된 이력서의 정보를 처리하고 페이지에 표시하는 
컨트롤러 클래스입니다. 사용자가 입력한 이력서 데이터와 선택한
 템플릿 스타일을 렌더링하고 HTML로 출력하는 메서드를 포함합니다.


5-4+ Projects 부분(+버튼)
프로젝트 종류 & 옆에 선택지 창(개인 프로젝트 / 팀 프로젝트)
프로젝트 제목 input-text
참여자(기여도) input-text ( input-text %)
수행 기간 input-text ~ input-text (총 #일)
URL input-text
주요 기능(+버튼) input-text
비고 input-textarea


5-5+ html형식(pdf는 되면 하기)으로 다운로드 받을 수 있게 링크
( DownloadService에 연결 ) 
</body>
</html>