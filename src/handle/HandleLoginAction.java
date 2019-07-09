package handle;

import java.io.PrintWriter;





import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import gamelist.GameList;
import gamelist.getAllInfo;
import member.MemberDAO;


public class HandleLoginAction implements HandleImpl {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
	      HttpSession session=request.getSession(true);
	      PrintWriter out = response.getWriter();
	      GameList g=null;

		String id=request.getParameter("id");
		String pw=request.getParameter("pw");

	
	
	
		MemberDAO mdao = new MemberDAO();
		
		int result = mdao.login(id,pw);
		
		System.out.println("리절트값 : " +result);
		
		if(result == 1){ //로그인 성공시
				//로그인 성공시 메인페이지에 세션값으로 id를 보내준다.
			//session.setAttribute("nickname", member.getNickname());
			
			g=new getAllInfo();
			
			try {
				g.createL(request,response);
				session.setAttribute("result", "1");
				session.setAttribute("id", id);//로그인 성공시 메인페이지에 세션값으로 id를 보내준다.

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else{
			
			session.setAttribute("result", "0");
		}
	}
	
}