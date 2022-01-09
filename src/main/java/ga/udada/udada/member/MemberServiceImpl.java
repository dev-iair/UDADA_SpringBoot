package ga.udada.udada.member;

import java.util.List;

import ga.udada.udada.mapper.MemberMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

	private final MemberMapper memberMapper;
	private final PasswordEncoder passwordEncoder;
	
	@Override
	public void join(MemberDTO memberDTO) {
		memberDTO.setMPw(passwordEncoder.encode(memberDTO.getMPw()));
		memberMapper.join(memberDTO);
	}

	@Override
	public int duplecateEmail(String mEmail) {
		return memberMapper.duplecateEmail(mEmail);
		
	}

	@Override
	public void joinStep2(MemberSpecDTO memberSpecDTO) {
		memberMapper.joinStep2(memberSpecDTO);
	}

	/*
	 * @Override public int pwdCheck(MemberDTO memberDTO) {
	 * //memberDTO.setMPw(passwordEncoder.encode(memberDTO.getMPw())); return
	 * memberMapper.pwdCheck(memberDTO); }
	 */

	@Override
	public MemberDTO myProfile(String mEmail) {
		//System.out.println(mEmail);
		return memberMapper.myProfile(mEmail);
	}


	@Override
	public void leave(MemberDTO memberDTO) {
		memberMapper.leave(memberDTO);
	}

	@Override
	public void updateMyProfile(MemberDTO memberDTO) {
		//System.out.println("#"+memberDTO.getMEmail()+"#");
		memberDTO.setMPw(passwordEncoder.encode(memberDTO.getMPw()));
		memberMapper.updateMyProfile(memberDTO);
	}

	@Override
	public List<MemberSpecDTO> selectMyWeight(String mEmail) {
		return memberMapper.selectMyWeight(mEmail);
	}

	@Override
	public MemberSpecDTO currentMyWeight(String mEmail) {
		return memberMapper.currentMyWeight(mEmail);
	}

	@Override
	public void insertWeight(MemberSpecDTO memberSpecDTO) {
		memberMapper.insertWeight(memberSpecDTO);
	}

	@Override
	public void deleteWeight(int msNo) {
		memberMapper.deleteWeight(msNo);
	}

	@Override
	public List<MemberSpecDTO> getMyWeightAndPaging(int pageNum, int pageSize, String mEmail) throws Exception {
		return memberMapper.getMyWeightAndPaging(pageNum, pageSize, mEmail);
	}

	@Override
	public int countAll(int pageNum, int pageSize, String mEmail) {
		return memberMapper.countAll(pageNum, pageSize, mEmail);
	}

	@Override
	public MemberDTO pwdCheck(String mEmail) {
		
		return memberMapper.pwdCheck(mEmail);
	}

	@Override
	public MemberDTO findMEmail(String mEmail) {
		return memberMapper.findMEmail(mEmail);
	}

	@Override
	public void updatePwd(MemberDTO memberDTO) {
		memberMapper.updatePwd(memberDTO);
	}

	@Override
	public void updateMyProfileWithoutPwd(MemberDTO memberDTO) {
		memberMapper.updateMyProfileWithoutPwd(memberDTO);
	}

	
	
}
