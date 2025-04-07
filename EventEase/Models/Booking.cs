using System.ComponentModel.DataAnnotations.Schema;

namespace EventEase.Models
{
    public class Booking
    {
        public int BookingID { get; set; }

        [ForeignKey("Venue")]

        public int? VenueID { get; set; }

        public Venue? Venue { get; set; }

        [ForeignKey("Events")]

        public int? EventID { get; set; }

        public Events? Events { get; set; }

        public DateTime BookingDate
        {
            get; set;
        }
    }
}
