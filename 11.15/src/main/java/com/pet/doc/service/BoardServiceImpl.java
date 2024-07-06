package com.pet.doc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.doc.mapper.BoardMapper;
import com.pet.doc.model.AttFileVO;
import com.pet.doc.model.BoardLikeVO;
import com.pet.doc.model.BoardVO;
import com.pet.doc.model.ReplyLikeVO;
import com.pet.doc.model.ReplyVO;
import com.pet.doc.model.SearchVO;
import com.pet.doc.util.PageHelper;
import com.pet.doc.util.PageHelper2;


@Service(value = "boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper boardMapper;
	
	PageHelper pageHelper = new PageHelper();
	PageHelper2 pageHelper2 = new PageHelper2();

	@Override
	public List<BoardVO> getBoardList(SearchVO searchVO) {
		int currentPage = searchVO.getPage();
	    int startRow = (currentPage - 1) * pageHelper.getPageSize() +1 ; 
	    int endRow   = currentPage * pageHelper.getPageSize(); 
	
	    searchVO.setStartRow(startRow);
	    searchVO.setEndRow(endRow);
	    
	    return this.boardMapper.getBoardList(searchVO);
	}
	
	
	 @Override
	public List<BoardVO> getBestBoardList(SearchVO searchVO) {
		int currentPage = searchVO.getPage();
	    int startRow = (currentPage - 1) * pageHelper2.getPageSize() +1 ; 
	    int endRow   = currentPage * pageHelper2.getPageSize(); 

	    searchVO.setStartRow(startRow);
	    searchVO.setEndRow(endRow);
	    
	    return this.boardMapper.getBestBoardList(searchVO);
	}


	@Override
	public List<BoardVO> getweekBestBoardList(SearchVO searchVO) {

	    return this.boardMapper.getweekBestBoardList(searchVO);
	}


	@Override public StringBuffer getPageUrl(SearchVO searchVO) {
		  // TODO Auto-generated method stub
	 
	 int totalRow = boardMapper.getTotalRow(searchVO); return
	 pageHelper.getPageUrl(searchVO, totalRow); 
	 }
	
	 

	@Override
	public StringBuffer getPageUrl2(SearchVO searchVO) {
		// TODO Auto-generated method stub
		 int totalRow = boardMapper.getTotalRow(searchVO); return
		 pageHelper2.getPageUrl(searchVO, totalRow); 
	}


	@Override
	public BoardVO getArticle(int bno) {
		// TODO Auto-generated method stub
		return this.boardMapper.getArticle(bno);
	}

	@Override
	public int writeArticle(BoardVO board) {
		// TODO Auto-generated method stub
		return boardMapper.writeArticle(board);
	}

	@Override
	public int updateArticle(BoardVO board) {
		// TODO Auto-generated method stub
		return this.boardMapper.updateArticle(board);
	}

	@Override
	public int deleteArticle(int bno) {
		// TODO Auto-generated method stub
		return this.boardMapper.deleteArticle(bno);
	}

	@Override
	public int getTotalRow(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int incrementGoodCnt(int bno) {
		// TODO Auto-generated method stub
		 return this.boardMapper.incrementGoodCnt(bno);
	}

	@Override
	public int incrementReplyCnt(int bno) {
		// TODO Auto-generated method stub
		return this.boardMapper.incrementReplyCnt(bno);
	}

	@Override
	public List<ReplyVO> getReplyList(int bno) {
		// TODO Auto-generated method stub
		return this.boardMapper.getReplyList(bno);
	}

	@Override
	public ReplyVO getReply(int rno) {
		// TODO Auto-generated method stub
		return this.boardMapper.getReply(rno);
	}

	@Override
	public int writeReply(ReplyVO reply) {
		// TODO Auto-generated method stub
		int bno = reply.getBno();
		this.boardMapper.incrementReplyCnt(bno);
		return this.boardMapper.writeReply(reply);
	}

	@Override
	public int updateReply(ReplyVO reply) {
		// TODO Auto-generated method stub
		return this.boardMapper.updateReply(reply);
	}

	@Override
	public int deleteReply(int rno) {
		// TODO Auto-generated method stub
		return this.boardMapper.deleteReply(rno);
	}

	@Override
	public int deleteReplyBybno(int bno) {
		// TODO Auto-generated method stub
		return this.boardMapper.deleteReplyBybno(bno);
	}

	@Override
	public int incReplyGoodCnt(int rno) {
		// TODO Auto-generated method stub
		return this.boardMapper.incReplyGoodCnt(rno);
	}

	@Override
	public List<AttFileVO> getFileList(int bno) {
		// TODO Auto-generated method stub
		   return this.boardMapper.getFileList(bno);
	}

	@Override
	public String getFileName(int fno) {
		// TODO Auto-generated method stub
		return this.boardMapper.getFileName(fno);
	}

	@Override
	public int insertFile(AttFileVO file) {
		// TODO Auto-generated method stub
		return boardMapper.insertFile(file);
	}

	@Override
	public int deleteFile(int fno) {
		// TODO Auto-generated method stub
		return this.boardMapper.deleteFile(fno);
	}

	@Override
	public int deleteFileBybno(int bno) {
		// TODO Auto-generated method stub
		return this.boardMapper.deleteFileBybno(bno);
	}

	@Override
	public int addBoardLike(BoardLikeVO boardLike) {
		// TODO Auto-generated method stub
		 return this.boardMapper.addBoardLike(boardLike);
	}

	@Override
	public int getBoardLike(BoardLikeVO boardLike) {
		// TODO Auto-generated method stub
		 return this.boardMapper.getBoardLike(boardLike);
	}

	@Override
	public int addReplyLike(ReplyLikeVO replyLike) {
		// TODO Auto-generated method stub
		return this.boardMapper.addReplyLike(replyLike);
	}

	@Override
	public int getReplyLike(ReplyLikeVO replyLike) {
		// TODO Auto-generated method stub
		return this.boardMapper.getReplyLike(replyLike);
	}


	@Override
	public int decreaseReplyCnt(int bno) {
		// TODO Auto-generated method stub
		return this.boardMapper.decreaseReplyCnt(bno);
	}
	
	

}
