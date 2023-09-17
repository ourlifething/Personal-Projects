<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bungee+Inline&family=Caveat+Brush&display=swap" rel="stylesheet">
<title>top Cat Health Management</title>
 <style>
        /*ページ全体のスタイル */
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start; /*画像を上に配置するため */
            min-height: 100vh; /* 画面の高さに合わせる */
            background: #83edc1;
 			background: linear-gradient(to right, #83edc1, #a8eed0);
        }

        /* 画像のスタイル */
        .image-container {
            position: relative; /* 相対位置指定 */
            top: 20px; /* 画像を少し上に配置（調整可能） */
        }

        /* 画像のスタイル（中央配置のため） */
        img {  	
        	width: 200px; /* 幅を指定（任意の幅に変更可能） */
            height: auto; /* 高さは自動調整 */
            display: block;
            margin: 0 auto;
            margin-top:15%;
        }
        /* ボタンにカスタムスタイルを適用 */
		.btn {
    		margin-top: 10%; /* 上部マージンを設定 */
    		background-color: orange; /* 背景色をオレンジに設定 */
    		color: white; /* テキスト色を白に設定 */
    		padding: 10px 20px; /* パディングを設定 */
    		border: none; /* ボーダーをなしに設定 */
    		border-radius: 5px; /* 角丸化 */
    		cursor: pointer; /* マウスカーソルをポインターに変更 */
    		transition: background-color 0.3s ease; /* ホバー時のトランジション */
		}

		/* ホバー時のスタイル */
		.btn:hover {
   		 	background-color: darkorange; /* ホバー時の背景色を変更 */
		}
		/* テキストに影をつけるスタイル */
		.text-with-shadow {
   			font-family: 'Bungee Inline', cursive; /* フォントファミリーを設定 */
    		font-size: 36px; /* フォントサイズを設定 */
    		color: darkorange; /* テキスト色を設定 */
    		text-align: center; /* テキストを中央揃えにする */
    		text-transform: uppercase; /* テキストを大文字に変換（任意） */
    		text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* 影の設定 */
		}
	
        
    </style>
</head>
<body>
	<div align="center" class="image-container">
		<h1 class="text-with-shadow" style="font-family: 'Bungee Inline', cursive; color:white;">Cats Health Managements</h1>
		
        <img src="/catHealthManagement/images/chichi_gugu.png">
   
		<form action="Login" method="post">
    		<button type="submit" class="btn">Enter</button> 
    	</form>
    	<small><p style="margin-top:50px;">Copyright 2023 Ourlifething®️ All Rights Reserved.</p></small>
    </div>
</body>
</html>