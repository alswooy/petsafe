package com.pet.doc.util;

import org.springframework.stereotype.Component;

import com.pet.doc.model.SearchVO;

@Component
public class PageHelper2 {
		
	private int pageSize = 10; 
	private int blockSize = 10; 

	public int getPageSize() {
		return pageSize;
	}

	public int getBlockSize() {
		return blockSize;
	}


	public StringBuffer getPageUrl(SearchVO searchVO, int totalRow) {
		
		StringBuffer pageHtml = new StringBuffer();
		
		int currentPage = searchVO.getPage();
		
		String key = searchVO.getKeyword();
		String type = searchVO.getType();
		
		String smsg = null;
		
		if (key != "") {
			smsg = "&type="+type+"&keyword="+key ;
		}
		else {
			smsg = "";
		}
		
		int startPage = 0;
		int endPage = 0;
		
	
		startPage = ((currentPage-1) / blockSize) * blockSize + 1;
		endPage = startPage + blockSize - 1;
		
	
		int totalPage = totalRow/pageSize + 1;
		int totalBlock = totalPage/blockSize + 1;
		int currentBlock = currentPage - 1; 
		

		if(endPage > (totalRow / pageSize) ) {
			endPage = (totalRow /pageSize) + 1;
		}
	
		if(currentBlock > 0){
			pageHtml.append("<div class='pagingBorder'><div class='backPage'><a href=\"generalForumBest?page="+(currentPage-1)+ smsg + "\" style='text-decoration: none;font-weight:bold;color:#7e7e7e;' ><</a></div>");
		}else{
			pageHtml.append("<div class='pagingBorder'>");
		}
	
		for(int i = startPage ; i <= endPage ; i++) {
			if(i == currentPage){
				if(i == startPage) {
					pageHtml.append("<div class='paging_checked' style='border-top-left-radius: 10px;border-bottom-left-radius: 10px;margin-left: -1px;'>");
					pageHtml.append( i );
					pageHtml.append("</div>");
				}else if(i == endPage){
					pageHtml.append("<div class='paging_checked' style='border-top-right-radius: 10px;border-bottom-right-radius: 10px;margin-right: -1px;'>");
					pageHtml.append( i );
					pageHtml.append("</div>");
				}else {
					pageHtml.append("<div class='paging_checked' style='border-left-color: rgb(230, 230, 230);border-left-style: solid;border-left-width: 2px;'>");
					pageHtml.append( i );
					pageHtml.append("</div>");
				}

			} else {
				if(i == startPage) {
					pageHtml.append("<div class='paging' style='border-left:none;'><a href=\"generalForumBest?page=" + i + smsg + "\" style='text-decoration: none;color:black;'>" +i+"</a></div>");
				}else{
					pageHtml.append("<div class='paging'><a href=\"generalForumBest?page=" + i + smsg + "\" style='text-decoration: none;color:black;'>" +i+"</a></div>");
				}
				
			}		
		}

		if(currentBlock == (endPage-1)){
			pageHtml.append("</div>");
		}else{
			pageHtml.append("<div class='frontPage'><a href=\"generalForumBest?page="+(currentPage+1)+ smsg + "\" style='text-decoration: none;font-weight:bold;color:#7e7e7e;'>></a></div></div>");
		}
			
		return pageHtml;
	}

}
