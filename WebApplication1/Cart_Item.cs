using System;

namespace WebApplication1.Models
{
    [Serializable] // Important so it can be stored in Session
    public class Cart_Item
    {
        public int ItemID { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }

        public int ItemQuantity
        {
            get { return Quantity; }
            set { Quantity = value; }
        }
    }
}
