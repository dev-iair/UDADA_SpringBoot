package ga.udada.udada.foodmy;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FoodMyDTO {
	
	private Long fmNo;
	private String mEmail;
	private String fNo;
	private String fmDate; 
	private int fmAmount;
	private Long rNo;

}
