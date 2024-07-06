package com.pet.doc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.doc.model.AttFileVO;
import com.pet.doc.model.BoardLikeVO;
import com.pet.doc.model.BoardVO;
import com.pet.doc.model.ReplyLikeVO;
import com.pet.doc.model.ReplyVO;
import com.pet.doc.model.SearchVO;

@Mapper
public interface BoardMapper {
	
	List<BoardVO> getBoardList( SearchVO searchVO); 
	List<BoardVO> getBestBoardList(SearchVO searchVO);
	List<BoardVO> getweekBestBoardList(SearchVO searchVO);
	
	int getTotalRow(); // ��ü�� �� ��ȸ
	
	BoardVO getArticle(int bno); //����ȸ
	int writeArticle(BoardVO board); // ������
	int updateArticle(BoardVO board);//�ۼ���
	int deleteArticle(int bno); // �ۻ���
	
	int getTotalRow(SearchVO searchVO); // ��ü�� �� ��ȸ
	

	int incrementGoodCnt(int bno); //���߿� ����
	int incrementReplyCnt(int bno); // ��� �� ����
	
	List<ReplyVO> getReplyList(int bno);
	ReplyVO getReply(int rno); //��� ��ȸ
	
	int writeReply(ReplyVO reply); //�������
	int updateReply(ReplyVO reply); //��� ����
	int deleteReply(int rno); //��� ����
	int deleteReplyBybno(int bno); //���ۿ� �Ҽӵ� ��� ��ü ����
	int decreaseReplyCnt(int bno);
	
	int incReplyGoodCnt(int rno); //��� ���ƿ� ����
	
	List<AttFileVO> getFileList(int bno);//÷������ ��� ��ȸ
	String getFileName(int fno); //÷������ �̸� ��ȸ
	int insertFile(AttFileVO file); // ÷������ ����
	
	int deleteFile(int fno); //÷������ ����
	int deleteFileBybno(int bno); //���ۿ� �Ҽӵ� ÷������ ��ü ����
	
	int addBoardLike(BoardLikeVO boardLike); // id-Ư���� ���ƿ� ��� ����
	int getBoardLike(BoardLikeVO boardLike); //  id-Ư���� ���ƿ� ��� ��ȸ
	
	int addReplyLike(ReplyLikeVO replyLike); // id-Ư����� ���ƿ� ��� ����
	int getReplyLike(ReplyLikeVO replyLike); // id-Ư����� ���ƿ� ��� ��ȸ
	
	

}
