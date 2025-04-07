using System.ComponentModel.DataAnnotations;

namespace EventEase.Models
{
    public class Venue
    {
        [Key]
        public int VenueID { get; set; }

        [Required]
        public string VenueName { get; set; }

        [Required]
        public string Locations { get; set; }

       
        public int Capacity { get; set; }

   
        public string ImageUrl { get; set; }

        
         
    }
}
