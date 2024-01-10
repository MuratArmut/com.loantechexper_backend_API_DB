package pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoansRejectPOJO {

    /*
    {
    "reason":"Bank info is wrong."
   }
     */

    private String reason;
}
