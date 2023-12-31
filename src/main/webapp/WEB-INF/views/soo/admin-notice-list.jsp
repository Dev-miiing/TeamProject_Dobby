<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>관리자 공지사항 등록페이지</title>
</head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/soo/admin-nav.css"/>
<link rel="stylesheet" href="/css/soo/admin-notice-list.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    section whole{
        width:100% ;
    }
</style>
<body>

<div class="admin">
    <div class="Header">
        <span class="span1">관리자 </span>
        <span class="span2">매뉴얼</span>
        <ul class="navi">
            <li>
                <a href="#">
                    <span class="menuWrap">쇼핑몰 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="menuWrap">회원 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="menuWrap">게시판 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="menuWrap">접속 통계<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="menuWrap">배너 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
        </ul>
    </div>


    <div class="admin-bar">
        <div class="admin-left">
            <h2>쇼핑몰관리</h2>
            <ul  class="admin-ul">

                <li class="on"><a href="#" onfocus="this.blur();">고객센터 관리</a>
                    <ul>
                        <li><a href="/admin/notice/list" onfocus="this.blur();">공지사항</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">FAQ</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">1:1 상담</a></li>
                    </ul>
                </li>

                <li class="on"><a href="#" onfocus="this.blur();">검색어 관리</a>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">검색어 목록</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">검색어 통계</a></li>
                    </ul>
                </li>

            </ul>


        </div><!-- //admin-left// -->

        <div class="admin-container">
            <div class="admin-location">HOME &gt; 고객센터 관리 &gt; 공지사항 &gt; 등록</div>

            <div class="admin-contents">
                <h3>공지사항 목록</h3>
                <p class="txtbox1 top1">
                    공지사항 목록을 보여주는 페이지입니다.
                </p>
                <%--카테고리, 상태를 선택할 수 있는 부분--%>

                <div class="inv-list">
                    <!-- 실제 구현 페이지 -->
                    <section class="whole">
                        <div class="listHead">
                            <div>
                                <%--@declare id="cate"--%><label for="cate">카테고리</label>
                                <select id="catelist" name="BBS_CATE" style="height: 30px; width: 150px;" value="${noticeDto.BBS_CATE}">
                                    <option value="고객 센터">고객 센터</option>
                                    <option value="매장 공지">매장 공지</option>
                                    <option value="배송 공지">배송 공지</option>
                                    <option value="쇼핑몰 공지">쇼핑몰 공지</option>
                                    <option value="이벤트 공지">이벤트 공지</option>
                                </select>
                            </div>

                            <div>
                                <%--@declare id="status"--%><label for="status">상태</label>
                                <select id="statuslist" name="STUS" style="height: 30px; width: 150px;" value="${noticeDto.STUS}">
                                    <option value="게시중">게시중</option>
                                    <option value="비공개">비공개</option>
                                    <option value="수정중">수정중</option>
                                    <option value="삭제예정">삭제예정</option>
                                </select>
                            </div>

                        </div>
                        <div class="listMid">
                            <span class="cnt">총 ${totalCnt}개</span>
                            <span class="btn">
                                <button id="homeBtn" type="button">
                                    <a href="/cs/notice/list">NOTICE</a>
                                </button>
                                <button id="writeBtn" type="submit">글쓰기</button>
                            </span>
                        </div>

                        <div class="list">
                            <table>
                                <colgroup>
                                    <col style="width: 6%;">
                                    <col style="width: 8%">
                                    <col style="width: 40%;">
                                    <col style="width: 8%;">
                                    <col style="width: 7%">
                                    <col style="width: 18%;">
                                    <col style="width: 15%;">
                                </colgroup>

                                <tbody>
                                <tr>
                                    <th>번호</th>
                                    <th>카테고리</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>상태</th>
                                    <th>등록일시</th>
                                    <th>버튼</th>
                                </tr>
                                <c:forEach var="Notice" items="${adminNoticeList}">
                                    <tr>
                                        <!--  게시물 번호 -->
                                        <td class="nb_id">${Notice.NB_ID}</td>
                                        <!--  게시물 카테고리 -->
                                        <td class="bbs_cate">${Notice.BBS_CATE}</td>
                                        <!--  게시물 제목 -->
                                        <td class="ttl"><a href="<c:url value="/admin/notice/read${ph.sc.queryString}&NB_ID=${Notice.NB_ID}"/>">${Notice.TTL}</a></td>
                                        <!--  게시물 작성자 -->
                                        <td class="wrtr">${Notice.WRTR}</td>
                                        <!--  게시물 상태 -->
                                        <td class="stus">${Notice.STUS}</td>
                                        <!--  게시물 작성일 -->
                                        <td class="reg_dtm"><fmt:formatDate value="${Notice.REG_DTM}" pattern="yyyy-MM-dd hh:mm:ss" type="date"/></td>
                                        <!--  수정, 삭제버튼 -->
                                        <td>
                                            <button id="modifyBtn" type="submit">수정</button>
                                            <button id="removeBtn" type="submit">삭제</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <!-- 페이징 -->
                            <div class="paging">
                                <c:if test="${ph.showPrev}">
                                <a class="page">
                                    <a href="<c:url value="/admin/notice/list?page=${ph.beginPage-1}"/>">&lt;</a>
                                    </c:if>
                                    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                                    <a href="<c:url value="/admin/notice/list?page=${i}"/>">${i}</a>
                                    </c:forEach>
                                    <c:if test="${ph.showNext}">
                                    <a href="<c:url value="/admin/notice/list?page=${ph.endPage+1}"/>">&gt;</a>
                                    </c:if>
                            </div>

                        </div>



                    </section>
                </div>
            </div>
        </div><!-- //Container// -->
    </div>
</div>


<div class="admin-footer">
    Copyright ⓒ 2023 됐나욧 All rights reserved.
</div>
<script>
    $(document).ready(function() {
        $("#writeBtn").on("click", function(){
            location.href="<c:url value='/admin/notice/write'/>";
        });

        $("#removeBtn").on("click", function(){
            location.href="<c:url value='/admin/notice/write'/>";
        });

    })
</script>
</body>
</html>
