package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MemberDAO;
import dao.OrderDAO;
import vo.MemberBean;
import static db.JdbcUtil.*;

public class AdminMemberSearchService {

	public String getJSON(String m_name, String filter, int page, int limit) {
		Connection con = getConnection();
		if(m_name == null) m_name = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		ArrayList<MemberBean> resultList = memberDAO.search(m_name, filter, page, limit);
		for(int i = 0; i < resultList.size(); i++) {
			result.append("[{\"value\": \"" + resultList.get(i).getM_id() + "\"},");
			result.append("{\"value\": \"" + resultList.get(i).getM_name() + "\"},");
			result.append("{\"value\": \"" + resultList.get(i).getM_phone() + "\"},");
			if(resultList.get(i).getM_gender() == 0) {
				result.append("{\"value\": \"" + "남" + "\"},");
			}else {
				result.append("{\"value\": \"" + "여" + "\"},");
			}
			switch(resultList.get(i).getG_id()) {
			case 0: result.append("{\"value\": \"" + "White" + "\"},"); break;
			case 1: result.append("{\"value\": \"" + "Green" + "\"},"); break;
			case 2: result.append("{\"value\": \"" + "Red" + "\"},"); break;
			case 3: result.append("{\"value\": \"" + "Black" + "\"},"); break;
			default: result.append("{\"value\": \"" + "White" + "\"},"); break;
			}
			result.append("{\"value\": \"" + resultList.get(i).getM_rdate() + "\"},");
			if(resultList.get(i).getM_drop() != null) {
				result.append("{\"value\": \"" + "탈퇴" + "\"}],");
			}else {
				result.append("{\"value\": \"" + " " + "\"}],");
			}
		}
		result.append("]}");
		close(con);
		
		return result.toString();
	}

	public int getListCount() {
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		int listCount = memberDAO.getListCount();
		close(con);
		return listCount;
	}

}
