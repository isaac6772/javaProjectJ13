package common;

import javax.servlet.http.HttpServletRequest;

public class Paging {
	 public void pageChange(HttpServletRequest request ,  int totRecCnt , int pag , int pageSize , int blockSize ) 
	    {
	 
	        // 페이징처리
	        int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1 ;
	        int startIndexNo = (pag - 1) * pageSize;
	        int curScrStartNo = totRecCnt - startIndexNo;
	        
	        int curBlock = (pag - 1) / blockSize;
	        int lastBlock = (totPage - 1) / blockSize;
	        
	        request.setAttribute("pag", pag);
	        request.setAttribute("pageSize", pageSize);
	        request.setAttribute("totPage", totPage);
	        request.setAttribute("startIndexNo", startIndexNo);
	        request.setAttribute("curScrStartNo", curScrStartNo);
	        request.setAttribute("blockSize", blockSize);
	        request.setAttribute("curBlock", curBlock);
	        request.setAttribute("lastBlock", lastBlock);
	    }
}
