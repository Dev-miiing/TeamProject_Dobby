package com.dobby.project.soo;

import java.util.List;
import java.util.Map;

public interface NoticeDao {
    NoticeDto select(Integer NB_ID) throws Exception;   //게시물 번호로 게시물을 조회

    // 나중에 String WRTR 추가하기, 관리자 계정(이름)
    int delete(Integer NB_ID) throws Exception;    //게시물 번호, 작성자로 게시물 삭제

    int insert(NoticeDto dto) throws Exception;     // 게시물 작성

    int update(NoticeDto dto) throws Exception;     // 게시물 수정

    int increaseViewCnt(Integer NB_ID) throws Exception;    // 게시물별 조회수

    List<NoticeDto> selectPage(Map map) throws Exception;   // 페이지 단위로 게시물 조회, Map = 페이지번호, 페이지 당 게시물 수

    List<NoticeDto> selectAll() throws Exception;       // 모든 게시물 조회

    List<NoticeDto> selectByCate(String BBS_CATE) throws Exception;     // 카테고리별 게시물 조회

    int deleteAll() throws Exception;   // 모든 게시물 삭제

    int countAll() throws Exception;   // 게시물 전체 개수 조회

    int countByCate(String BBS_CATE) throws Exception;  // 카테고리별 게시물 개수 조회

    int searchResultCnt(SearchCondition sc) throws Exception;   // 검색 결과의 총 개수
    List<NoticeDto> searchSelectPage(SearchCondition sc) throws Exception;  // 검색 결과 목록


}
