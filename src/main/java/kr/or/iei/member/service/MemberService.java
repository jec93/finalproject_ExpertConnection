package kr.or.iei.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.member.dao.MemberDao;
import kr.or.iei.member.model.vo.Member;

@Service("service")
public class MemberService {

	@Autowired
	@Qualifier("dao")
	private MemberDao memberDao;
	
	public Member memberLogin(Member member) {
		return memberDao.memberLogin(member);
	}
	
	public int join(Member member) {
		return memberDao.join(member);
	}

	public int idDuplChk(String memberId) {
		return memberDao.idDuplChk(memberId);
	}


}
