<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String error = (String)request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="css/basic.css">
<title>main</title>
</head>
<body>
    <div class="container px-5 my-5">
        <form id="ResultMonth" data-sb-form-api-token="API_TOKEN" action="ResultMonth" method="post">
        	<div class="mb-3">
                <label class="form-label" for="名前">名前</label>
                <select class="form-select" name="名前" id="名前" aria-label="名前">
                	<option value="">ペットを選択</option>
                    <option value="ぐぐ">ぐぐ</option>
                    <option value="ちっち">ちっち</option>
                </select>
                 <%if(error != null ){ %>
                <p><%=error %></p>
                <%} %>
            </div>
            <div class="mb-3">
                <label class="form-label" for="カリカリ">カリカリ</label>
                <select class="form-select" name="カリカリ" id="カリカリ" aria-label="カリカリ">
                	<option value="">選択してください</option>
                    <option value="60">15g 60kcl</option>
                    <option value="40">10g 40kcl</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label" for="黒缶">黒缶</label>
                <select class="form-select" name="黒缶" id="黒缶" aria-label="黒缶">
                	<option value="">選択してください</option>
                    <option value="23">半分 23kcl</option>
                    <option value="56">１袋 56kcl</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label" for="おさかな生活">おさかな生活</label>
                <select class="form-select" name="おさかな生活" id="おさかな生活" aria-label="おさかな生活">
                	<option value="">選択してください</option>
                    <option value="13">半分 13kcl</option>
                    <option value="26">1袋26kcl</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label d-block">おやつ</label>
                <div class="form-check">
                    <input class="form-check-input" id="クリスピーキッス1袋22Kcl" type="checkbox" name="おやつ" value="22" data-sb-validations="" />
                    <label class="form-check-label" for="クリスピーキッス1袋22Kcl">クリスピーキッス1袋22kcl</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" id="チュール1本7kcl" type="checkbox" name="おやつ" value="7" data-sb-validations="" />
                    <label class="form-check-label" for="チュール1本7kcl">チュール１本 7kcl</label>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label" for="メモ">メモ</label>
                <textarea class="form-control" name="メモ" id="メモ" type="text" placeholder="メモ" style="height: 10rem;" data-sb-validations=""></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label" for="体重G">体重(g)</label>
                <input class="form-control" name="体重G" id="体重G" type="text" placeholder="体重(g)" data-sb-validations="" />
            </div>
          
            <div class="d-grid">
                <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Submit</button>
           </div>
        </form>
    </div>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    <script type="text/javascript">
    function reloadPage() {
        window.location.reload(true); // 引数 true はキャッシュを無視してリロードすることを意味します
    }
    </script>
</body>
</html>