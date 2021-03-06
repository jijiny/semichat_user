package service.face.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.InquiryBoard;
import dto.InquiryBoardFile;
import util.Paging;

public interface InquiryBoardService {

	/**
	 * 강세미
	 * 2019-11-25
	 * 
	 * 요청파라미터 curPage를 파싱한다
	 * Board TB와 curPage 값을 이용한 Paging 객체를 생성하고 반환
	 * 
	 * @param req - 요청정보 객체
	 * @return Paging - 페이징 정보
	 */
	public Paging getPaging(HttpServletRequest req);

	
	/**
	 * 강세미
	 * 2019-11-25
	 * 
	 * 게시판 리스트를 얻어온다
	 * @param paging - 요청 페이징
	 * @return List - 리스트 정보
	 */
	public List getList(Paging paging);
	
	
	/**
	 * 강세미
	 * 2019-11-25
	 * 
	 * 조회수 업데이트
	 * @param board - 게시글 얻어오기
	 */
	public void hit(InquiryBoard board);

	
	/**
	 * 강세미
	 * 2019-11-25
	 * 
	 * boardno으로 게시글 보여주기위한 메소드
	 * 
	 * @param req - 파라미터 요청 정보 받아오기
	 * @return
	 */
	public InquiryBoard getBoardno(HttpServletRequest req);

	
	/**
	 * 강세미
	 * 2019-11-25
	 * 
	 * 상세보기 게시글 조회
	 *
	 * @param showboard - 파라미터 전달
	 * @return InquiryBoard - 게시글 정보
	 */
	public InquiryBoard view(InquiryBoard board);

	
	/**
	 * 강세미
	 * 2019-11-26
	 * 
	 * 글 작성 요청 받기(텍스트, 파일)
	 * 
	 * @param req - 요청 파라미터
	 * @param resp - 응답 파라미터
	 */
	public void write(HttpServletRequest req, HttpServletResponse resp);


	/**
	 * 강세미
	 * 2019-11-27
	 * 
	 * show를 위한 파일 정보 받아오기
	 * 
	 * @param board - 요청 파라미터
	 * @return 모델값 리턴
	 */
	public InquiryBoardFile getFileInfo(InquiryBoard board);


	/**
	 * dao에서 파일 넘버 얻어오기
	 * 
	 * @param downFile
	 */
	public void getFile(InquiryBoardFile downFile);

	
	/**
	 * 강세미
	 * 2019-11-27
	 * 파일 다운로드 
	 * 
	 * @param req - 파일 정보 요청
	 * @return 모델값 리턴
	 */
	public InquiryBoardFile getFile(HttpServletRequest req);

	
	/**
	 * 강세미
	 * 2019-11-27
	 * 
	 * 글 수정
	 * 
	 * @param req - 파라미터 요청 받기
	 * @param resp - 보내주기
	 */
	public void update(HttpServletRequest req, HttpServletResponse resp);

	
	/**
	 * 강세미
	 * 2019-11-28
	 * 
	 * 파일 넘버 가져오기
	 * 
	 * @param req - 요청 파라미터
	 * @return - 파일dto
	 */
	public InquiryBoardFile getFileNo(HttpServletRequest req);

	
	/**
	 * 강세미
	 * 2019-11-28
	 *  
	 * 게시글 파일 delete
	 * 
	 * @param file - 삭제 요청 받은 file
	 */
	public void delete(InquiryBoardFile file);

	
	/**
	 * 강세미
	 * 2019-11-28
	 * 
	 * 파일 제외 게시글 delete
	 * @param deleteBoard - 요청 받은 게시글
	 */
	public void delete(InquiryBoard deleteBoard);

	
	/**
	 * 강세미
	 * 2019-12-02
	 * 
	 * 글번호에 맞는 비밀번호 가져오기
	 * 
	 * @param board - boardno넘겨줌
	 * @return
	 */
	public InquiryBoard getBoardpw(InquiryBoard board);

	
}
