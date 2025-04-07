using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EventEase.Models
{
    public class Events
    {
        [Key]
        public int EventID { get; set; } 

        [Required]
        public string EventName { get; set; }

        [Required]
        public DateTime EventDate { get; set; }
 
        public string Descriptions { get; set; }

        [ForeignKey("Venue")]
        public int? VenueID { get; set; }

        public Venue? Venue { get; set; }
    }
}
