package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MemberDAO;
import vo.MemberBean;
import static db.JdbcUtil.*;

public class AdminMemberSearchService {

	public String getJSON(String m_name, String filter) {
		Connection con = getConnection();
		if(m_name == null) m_name = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		ArrayList<MemberBean> resultList = memberDAO.search(m_name, filter);
		for(int i = 0; i < resultList.size(); i++) {
			result.append("[{\"value\": \"" + resultList.get(i).getM_id() + "\"},");
			result.append("{\"value\": \"" + resultList.get(i).getM_name() + "\"},");
			result.append("{\"value\": \"" + resultList.get(i).getM_phone() + "\"},");
			if(resultList.get(i).getM_gender() == 1) {
				result.append("{\"value\": \"" + "남" + "\"},");
			}else {
				result.append("{\"value\": \"" + "여" + "\"},");
			}
			result.append("{\"value\": \"" + resultList.get(i).getM_rdate() + "\"}],");
		}
		result.append("]}");
		close(con);
		
		return result.toString();
	}

}
