package ga.udada.udada.member;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberSpecDTO {
	private long msNo;
	private String mEmail;
	private Date msDate;
	private double msHeight;
	private double msWeight;
	private double msGoal;
	
	private String msDateStr;
}
