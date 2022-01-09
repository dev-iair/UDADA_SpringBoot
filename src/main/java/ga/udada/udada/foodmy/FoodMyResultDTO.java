package ga.udada.udada.foodmy;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FoodMyResultDTO {

	private Long rNo;
	private String rTitle;
	private int rsKcal;
	private int rsCarbo;
	private int rsProtein;
	private int rsFat;
	private Long fmNo;
	private String mEmail;
	private String day;
	private int fmAmount;
	private String fNo;
	private String fName;
	private int fsKcal;
	private int fsCarbo;
	private int fsProtein;
	private int fsFat;
	
}
