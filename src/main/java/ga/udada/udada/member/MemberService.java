package ga.udada.udada.member;

import java.util.List;

public interface MemberService {
	void join(MemberDTO memberDTO);
	int duplecateEmail(String mEmail);
	void joinStep2(MemberSpecDTO memberSpecDTO);
	MemberDTO myProfile(String mEmail);
	void leave(MemberDTO memberDTO);
	//int pwdCheck(MemberDTO memberDTO);
	MemberDTO pwdCheck(String mEmail);
	void updateMyProfile(MemberDTO memberDTO);
	List<MemberSpecDTO> selectMyWeight(String mEmail);
	MemberSpecDTO currentMyWeight(String mEmail);
	void insertWeight(MemberSpecDTO memberSpecDTO);
	void deleteWeight(int msNo);
	List<MemberSpecDTO> getMyWeightAndPaging(int pageNum, int pageSize, String mEmail) throws Exception;
	int countAll(int pageNum, int pageSize, String mEmail);
	MemberDTO findMEmail(String mEmail);
	void updatePwd(MemberDTO memberDTO);
	void updateMyProfileWithoutPwd(MemberDTO memberDTO);
}
