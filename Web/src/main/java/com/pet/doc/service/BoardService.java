package com.pet.doc.service;

import java.util.List;

import com.pet.doc.model.AttFileVO;
import com.pet.doc.model.BoardLikeVO;
import com.pet.doc.model.BoardVO;
import com.pet.doc.model.ReplyLikeVO;
import com.pet.doc.model.ReplyVO;
import com.pet.doc.model.SearchVO;

public interface BoardService {
	
	List<BoardVO> getBoardList(SearchVO searchVO); 
	StringBuffer getPageUrl( SearchVO searchVO);
	StringBuffer getPageUrl2( SearchVO searchVO);
	
	List<BoardVO> getBestBoardList(SearchVO searchVO);//추천수로 정렬
	List<BoardVO> getweekBestBoardList(SearchVO searchVO);//이번주 인기글(추천수 정렬)
	
	BoardVO getArticle(int bno); 
	int writeArticle(BoardVO board); 
	int updateArticle(BoardVO board);
	int deleteArticle(int bno); 
	
	int getTotalRow(SearchVO searchVO);
	
	int incrementGoodCnt(int bno); 
	int incrementReplyCnt(int bno); 
	
	List<ReplyVO> getReplyList(int bno);
	ReplyVO getReply(int rno);
	
	int writeReply(ReplyVO reply); 
	int updateReply(ReplyVO reply); 
	int deleteReply(int rno); 
	int deleteReplyBybno(int bno);
	int decreaseReplyCnt(int bno);
	
	int incReplyGoodCnt(int rno);
	
	List<AttFileVO> getFileList(int bno);
	String getFileName(int fno); 
	int insertFile(AttFileVO file); 
	
	int deleteFile(int fno); 
	int deleteFileBybno(int bno); 
	
	int addBoardLike(BoardLikeVO boardLike); 
	int getBoardLike(BoardLikeVO boardLike);
	
	int addReplyLike(ReplyLikeVO replyLike); 
	int getReplyLike(ReplyLikeVO replyLike); 

}
