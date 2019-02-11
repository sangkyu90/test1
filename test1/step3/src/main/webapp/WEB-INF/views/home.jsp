<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<style type="text/css">
.pp{display: inline;}
.pag{display: inline;cursor: pointer;}
.curp{color:red;}
#btn{margin-left: 200px;}
.atrow{width:225px; height:26px;z-index: 1;background-color: white;}
.viewrow{width:225px; height:26px;z-index: 1;background-color: white;}
#rowsout{z-index: 1;position: absolute;}
#hrefout{z-index: 2;position: absolute; left: 150px;border-left: 1px solid lightgray; }
.hot{z-index: 2; width:80px; height:26px;}
</style>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	var ph = "";
	var page;
	var rows;
	var send;
	var d = 1;
	var step6 = ["name", "hak", "kor", "eng", "mat", "pw"];
	
	//성공했을때
	function succ(nn, data) {
		nn.remove();
		var tab = document.getElementById("tab");
		var n = document.createElement("tbody");
		n.id = "testTable";
		tab.appendChild(n);
		if(data != null){
			for (var j = 0; j < data.length; j++) {
				var tr = document.createElement("tr");
				for (x in data[j]) {
					var td = document.createElement("td");
					if(x == "name") {
						td.innerHTML = "<div onclick='detail(this.innerText)'>" + data[j][x] + "</div>";
						//this.innerText 스트링이 안되어서 이름만 한거
						//하지만 시퀀스넘버 받으면 아무 문제 없음
					}else{
						td.innerHTML = "<div>" + data[j][x] + "</div>";
					}
					tr.appendChild(td);
				}
				n.appendChild(tr);
			}
		}else{
			var tr = document.createElement("tr");
			var td = document.createElement("td");
			td.innerText = "검색결과 없음";
			tr.appendChild(td);
			n.appendChild(tr);
		}
	}

	//리스트 뿌리기
	function view(page, rows, d, send, pll) {
		if(!page){page = 1;}
		if(!rows){rows = 5;}
		if(!d){d = 1;}
		if(!send){send = "name";}
		var srh;
		if(pll) {
			srh = "";
		}else{
			srh = document.getElementById("srh").value;
		}
		var pg = document.getElementById("pg");
		var vo = document.getElementById("testTable");
		$.ajax({
			url : "list",
			type : "get",
			dataType : "json",
			data : {
				"a" : srh,
				"page" : page,
				"rows" : rows,
				"d" : d,
				"send" : send
			},
			success : function(data) {
				//console.log(data.paging);
				//console.log(data.list[0].name);
				page = data.paging[0].page;
				rows = data.paging[0].rows;
				paging(pg, data.paging);
				succ(vo, data.list);
				var rowsout = document.getElementById("rowsout");
				var hrefout = document.getElementById("hrefout");
				if(rowsout) rowsout.remove();
				if(hrefout) hrefout.remove();
			},
			error : function() {
				
			}
		});
	}
	
	//페이징 처리
	function paging(pgg, data) {
		page = data[0].page;
		rows = data[0].rows;
		pgg.remove();
		var outpg = document.getElementById("outpg");
		var pg = document.createElement("div");
		pg.id = "pg";
		outpg.appendChild(pg);
		var p ;
		if(data[0].total != 0) {
			prev(pg, p, data[0].page, data[0].rows);
			now(pg, p, data[0].page, data[0].rows, data[0].total)
			aft(pg, p, data[0].page, data[0].rows, data[0].total);
			curstate(pg, p, data[0].page, data[0].rows, data[0].total, data[0].records);
			selectrow(pg, data[0].rows);
		}else {
			prev(pg, p, 1, rows);
			now(pg, p, data[0].page, data[0].rows, 1);
			aft(pg, p, 1, rows, 1);
			curstate(pg, p, 0, 1, 0, 0);
			selectrow(pg, data[0].rows);
		}
		
	}
	
	//페이지들
	function now(pg, p, ppage, prows, ptotal) {
		for(var i = 1; i <= ptotal; i++) {
			p = document.createElement("p");
			p.className = "pp";
			if(i == ppage){
				p.innerHTML = "<div class='pag curp' onclick='view(" + i + "," + prows + "," + d + ")'> "+i+" </div>";
			}else{
				p.innerHTML = "<div class='pag' onclick='view(" + i + "," + prows + "," + d + ")'> "+i+" </div>";
			}
			pg.appendChild(p);
		}
	}
	
	//왼쪽 화살표
	function prev(pg, p, ppage, prows) {
		p = document.createElement("p");
		p.className = "pp";
		p.innerHTML = "<div class='pag' onclick='view(" + 1 + "," + prows + "," + d + ")'> << </div>";
		pg.appendChild(p);
		p = document.createElement("p");
		p.className = "pp";
		if((ppage*1 - 1) < 1){
			p.innerHTML = "<div class='pag' onclick='view(" + 1 + "," + prows + "," + d + ")'> < </div>";
		}else{
			p.innerHTML = "<div class='pag' onclick='view(" + (ppage*1 - 1) + "," + prows + "," + d + ")'> < </div>";
		}
		pg.appendChild(p);
	}
	//오른쪽 화살표
	function aft(pg, p, apage, arows, atotal) {
		p = document.createElement("p"); 
		p.className = "pp";
		if((apage*1 + 1) > atotal){
			p.innerHTML = "<div class='pag' onclick='view(" + atotal + "," + arows + "," + d + ")'> > </div>";
		}else{
			p.innerHTML = "<div class='pag' onclick='view(" + (apage*1 + 1) + "," + arows + "," + d + ")'> > </div>";
		}
		pg.appendChild(p);
		p = document.createElement("p");
		p.className = "pp";
		p.innerHTML = "<div class='pag' onclick='view(" + atotal + "," + arows + "," + d + ")'> >> </div>";
		pg.appendChild(p);
	}
	
	//현재records 보여주기 ex)1-5/13
	function curstate(pg, p, cpage, arows, atotal, arecords) {
		p = document.createElement("p"); 
		p.className = "pp";
		if(cpage == atotal) {
			p.innerText = (arows * (cpage - 1) + 1) + "-" +  arecords + "/" + arecords + "  ";
		}else{
			p.innerText = (arows * (cpage - 1) + 1) + "-" +  (arows * cpage) + "/" + arecords + "  ";
		}
		pg.appendChild(p);
	}
	
	//rows 수 바꾸기
	function selectrow(pg, rows) {
		var sel = document.createElement("select");
		sel.id = "sel";
		sel.onchange = function () {
			var s = document.getElementById("sel");
			view(1, s.value); 
			
		};
		var r = 5;
		for (var i = 0; i < 3; i++) {
			var op = document.createElement("option");
			op.setAttribute("value",r);
			op.innerText = r;
			if(rows == r){op.selected = true;}
			sel.appendChild(op);
			r += 5;
		}
		pg.appendChild(sel);
	}
	
	//접기버튼 
	function btn() {
		var btn = document.getElementById("btn");
		var hd = document.getElementById("hd");
		if(btn.innerText == "접기"){
			btn.innerText = "펴기";
			hd.style.display = "none";
		}else{
			btn.innerText = "접기";
			hd.style.display = "inline";
		}
	}
	
	//col 눌럿을 때 순서 바꾸기
	function ddd(send) {
		send = this.send;
		if(d == 2){
			d = 1;
			view(page, rows, d, send);
		}else{
			d = 2;
			view(page, rows, d, send);
		}
	}
	
	//글입력시 자동완성 리스트 뽑기
	function chk() {
		var rowsout = document.getElementById("rowsout");
		var hrefout = document.getElementById("hrefout");
		var srh = document.getElementById("srh");
		console.log("srh : " + srh.value);
		$.ajax({
			url : "chk",
			type : "get",
			dataType : "json",
			data : {
				"a" : srh.value
			},
			success : function(data) {
				//console.log("data : " + data);
				//console.log("data : " + data[0].pw);
				rsout(rowsout, data);
				linkconn(hrefout, data);
			}
		});
	}
	
	//검색어 자동완성
	function rsout(ro, data) {
		if(ro) {
			ro.remove();
			var onC = document.getElementById("onC");
			onC.style.display = "none";
		}
		var rowcont = document.getElementById("rowcont");
		var rowsout = document.createElement("div");
		rowsout.id = "rowsout";
		for (x in data) {
			//console.log(x);
			var atrow = document.createElement("div");
			atrow.innerHTML = "<div class='atrow' onmouseover='mo(" + x + ")' onmouseleave = ml(" + x + ") onclick='rowclick(\"" + data[x].name + "\" )'>" + data[x].name + "</div>";
			rowsout.appendChild(atrow);
		}
		//같은 div가 아니고 그 아래에 붙인다
		
		rowcont.appendChild(rowsout);
	}
	
	//마우스 올렷을 때
	function mo(num) {
		var atrows = document.getElementsByClassName("atrow");
		atrows[num].style.backgroundColor = "yellow";
	}
	
	//마우스 나갓을 때
	function ml(num) {
		var atrows = document.getElementsByClassName("atrow");
		atrows[num].style.backgroundColor = "white";
	}
	
	//검색어 클릭시
	function rowclick(num) {
		var rowsout = document.getElementById("rowsout");
		var hrefout = document.getElementById("hrefout");
		var srh = document.getElementById("srh");
		srh.value = num;
		rowsout.remove();
		hrefout.remove();
		var atrow = document.getElementById("onC");
		atrow.style.display = "none";
	}
	
	//링크 연결
	function linkconn(ho, data) {
		if(ho) ho.remove();
		var rowcont = document.getElementById("rowcont");
		var hrefout = document.createElement("div");
		hrefout.id = "hrefout";
		for (x in data) {
			//console.log(x);
			var atrow = document.createElement("div");
			atrow.innerHTML = "<div class='hot'><a href='#'>" + data[x].pw + "</a></div>";
			hrefout.appendChild(atrow);
		}
		var atrow = document.getElementById("onC");
		
		if(data[0]){
			atrow.style.display = "block";
			if(atrow.innerText == "안보기"){
				hrefout.style.display = "block";
			}else{
				hrefout.style.display = "none";
			}
		}else{
			atrow.style.display = "none";
		}
		rowcont.appendChild(hrefout);
		//rowcont.appendChild(atrow);
	}
	
	//링크들 보이게 하기
  	function disview() {
		var onC = document.getElementById("onC");
		var hrefout = document.getElementById("hrefout");
		if(onC.innerText == "보기"){
			hrefout.style.display = "block";
			onC.innerText = "안보기";
		}else{
			hrefout.style.display = "none";
			onC.innerText = "보기";
		}
	}
	
	//상세보기 전달
	function detail(data) {
		//alert(data);
		ph = data;
		var detail = document.getElementById("detail");
		$.ajax({
			url : "detail",
			type : "post",
			dataType : "json",
			data : {
				"a" : data
			},
			success : function(data) {
				//console.log(data[0]);
				detailTable(detail, data[0]);
			}
		});
	}
	
	//상세보기 테이블
	function detailTable(dt, data) {
		var detailout = document.getElementById("detailout");
		if(dt) dt.remove();
		var div = document.createElement("div");
		div.id = "detail";
		var table = document.createElement("table");
		var tr1 = document.createElement("tr");
		for(var i = 0; i < step6.length; i++){
			var td = document.createElement("td");
			td.innerText = step6[i];
			tr1.appendChild(td);
		}
		table.appendChild(tr1);
		var tr2 = document.createElement("tr");
		for(x in data){
			var td = document.createElement("td");
			//td.innerText = data[x];
			var inp = document.createElement("input");
			if(data[x] != null){
				inp.setAttribute("value",data[x]);
			}else{
				inp.setAttribute("value","");
			}
			inp.setAttribute("size","7");
			inp.setAttribute("id", x);
			if(x == "name" && data[x] != "") inp.setAttribute("readonly","readonly");
			td.appendChild(inp);
			tr2.appendChild(td);
		}
		table.appendChild(tr2);
		div.appendChild(table);
		detailout.appendChild(div);
		detailout.style.display = "block";
	}
	
	//수정
	function mod() {
		var hak = document.getElementById("hak").value;
		var kor = document.getElementById("kor").value;
		var eng = document.getElementById("eng").value;
		var mat = document.getElementById("mat").value;
		var pw = document.getElementById("pw").value;
		mdsend("mod", hak, kor, eng, mat, pw);
	}
	
	//삭제
	function del() {
		mdsend("del", "", "", "", "", "");
	}
	
	//수정 삭제 전달
	function mdsend(md, hak, kor, eng, mat, pw, name) {
		var detail = document.getElementById("detail");
		var pp;
		if(name){
			pp = name;
		}else{
			pp = ph
		}
		$.ajax({
			url : "menu",
			type : "POST",
			dataType : "json",
			data : {
				"menu" : md,
				"a" : pp,
				"hak" : hak,
				"kor" : kor,
				"eng" : eng,
				"mat" : mat,
				"pw" :pw
			},
			success : function(data) {
				//console.log("succes : " + data);
				console.log(page + " : " + rows + " : " + d + " : " + send);
				view(page, rows, d, send);
				detailTable(detail, data[0]);
			},
			error : function() {
				view(page, rows, d, send);
				var detailout = document.getElementById("detailout");
				var detail = document.getElementById("detail");
				detailout.style.display = "none";
				detail.style.display = "none";
			}
		});
	}
	
	//+버튼
	function pl() {
		var detail = document.getElementById("detail");
		var data = {
				"name" : "",
				"hak" : "",
				"kor" : "",
				"eng" : "",
				"mat" : "",
				"pw" : ""
		}
		detailTable(detail, data);
	}
	
	//등록
	function ins() {
		var hak = document.getElementById("hak").value;
		var kor = document.getElementById("kor").value;
		var eng = document.getElementById("eng").value;
		var mat = document.getElementById("mat").value;
		var pw = document.getElementById("pw").value;
		var name = document.getElementById("name").value;
		mdsend("ins", hak, kor, eng, mat, pw, name);
	}
	function re() {
		view(1, 5, 1, "name", "a");
		var detailout = document.getElementById("detailout");
		var detail = document.getElementById("detail");
		detailout.style.display = "none";
		detail.style.display = "none";
		var shr = document.getElementById("srh");
		shr.value = "";
	}
</script>
</head>
<body onload="view()">
<button id="btn" onclick="btn()">접기</button>
<div id="hd">
	<table id="tab">
		<thead>
			<tr>
				<td onclick="ddd('name')">이름</td>
				<td onclick="ddd('hak')">학번</td>
				<td onclick="ddd('kor')">국어</td>
				<td onclick="ddd('eng')">영어</td>
				<td onclick="ddd('mat')">수학</td>
				<td onclick="ddd('pw')">pw</td>
			</tr>
		</thead>
		<tbody id="inputData">
			
		</tbody>
		<tbody id="testTable">

		</tbody>
	</table>
	<div id="outpg">
	<div id="pg"></div>
	</div>
	<div>
		<input type="text" id="srh" size="30" onkeyup="chk()" autocomplete="off">
		<input type="button" value="전달" onclick="view()">
		<button onclick="pl()">+</button>
		<button onclick="re()">re</button>
	</div>
	<div id="rowcont">
		<div id="rowsout">
			<!-- <div class="atrow" onmouseover="mo(0)" onmouseleave="ml(0)"></div> -->
		</div>
		<div id="hrefout">
			<!-- <div class="hot"></div> -->
		</div>
		<div id='onC' class='viewrow' onclick='disview()' style="display: none;">안보기</div><!--  -->
	</div>
</div>
<br><br>
<div id='detailout' style="display: none;">
<button onclick="mod()">수정</button>
<button onclick="del()">삭제</button>
<button onclick="ins()">등록</button>
<div id="detail"></div>
</div>
</body>
</html>
