package admin;

import board.boardVO;

public class ApprovalAction {
	
public String approvalAction() throws Exception {
		
		paramClass.setNo(getNo());
		paramClass.setPassword(getPassword());
		
		resultClass = (boardVO) sqlMapper.queryForObject("selectPassword", paramClass);
		
		if(resultClass == null)
			return ERROR;
		
		return SUCCESS;
	}

}
