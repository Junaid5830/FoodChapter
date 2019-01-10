using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;
using System.Diagnostics;
using System.Threading;
using System.Data;
using System.Data.SqlClient;
using FoodChapter.DataCore.Managers;
using FoodChapter.DataManagers; 

namespace FoodChapter.DataCore.Managers
{
    class EmailHelper
    {
        public static void SendVendorEmail(string OrderId, string orderDate) //command line function
        {
            DataTable orderDetail = (new OrderManager()).GetOrderDataForVendorEmail(int.Parse(OrderId)).Tables[0];

            for (int loopCount = 0; loopCount < orderDetail.Rows.Count; loopCount++)
            {
                string body = @"<label>Dear Food Seller,</label>

                            <p style='" + "margin-top:30px;margin-bottom:50px;" + "'>New Order is placed. Below is New Order Detail : </p>";
                string textBody = " <table border=" + 1 + " cellpadding=" + 0 + " cellspacing=" + 0 + " width = " + 800 + "><tr bgcolor='#4da6ff'><td><b>Order Id</b></td>"+
                    " <td> <b> Foodies</b> </td> <td> <b> Mobile No</b> </td><td> <b> Payment</b> </td> <td> <b> Order Date</b> </td></tr>";

                textBody += "<tr><td>" + orderDetail.Rows[loopCount]["ORDER_ID"] + "</td><td> "
                    + orderDetail.Rows[loopCount]["NAME"] + "</td><td> "
                    + orderDetail.Rows[loopCount]["MOBILE"] + "</td><td> "
                    + orderDetail.Rows[loopCount]["PRICE"] + "</td><td> " 
                    + orderDate + "</td> </tr>";
                textBody += "</table>";
                //textBody += "<p style='" + "margin-top:30px;margin-bottom:30px;" + "'>For further details call : 042-11111111111 </p>";
                body += textBody;
                SendEmail(orderDetail.Rows[loopCount]["EMAIL"].ToString(), body);
            }
        }

        public static void SendUserEmail(string destinationAddress, string OrderId, string Payment, string orderDate) //command line function
        {
            DataTable orderDetail = (new OrderManager()).GetOrderDataForEmail(int.Parse(OrderId)).Tables[0];
            string body = @"<label>Dear Foodies, </label>

                            <p style='"+"margin-top:30px;margin-bottom:50px;"+"'>Thanks For Order, Your order has been submitted successfully. Below is your order Detail : </p>";
            string textBody = " <table border=" + 1 + " cellpadding=" + 0 + " cellspacing=" + 0 + " width = " + 400 + "><tr bgcolor='#4da6ff'><td><b>Order Id</b></td> <td> <b> Payment</b> </td> <td> <b> Order Date</b> </td></tr>";

            textBody += "<tr><td>" + OrderId + "</td><td> " + Payment + "</td><td> " + orderDate + "</td> </tr>";
            textBody += "</table>";
            textBody += "<h2 style='" + "margin-top:20px;margin-bottom:20px;" + "'>Order Detail </h2>";
            
            body += textBody;

            textBody = @" <table border=" + 1 + " cellpadding=" + 0 + " cellspacing=" + 0 + " width = " + 800 + "><tr bgcolor='#4da6ff'><td><b>Food Item</b></td>"+
                " <td> <b> Qty</b> </td><td><b>Amount</b></td><td> <b> Sub Total</b> </td><td><b>Food Seller</b></td> <td> <b> Phone</b> </td></tr>";  
            for (int loopCount = 0; loopCount < orderDetail.Rows.Count; loopCount++)  
            {
                int price = int.Parse(orderDetail.Rows[loopCount]["QUANTITY"].ToString()) * int.Parse(orderDetail.Rows[loopCount]["UNIT_AMOUNT"].ToString());
                textBody += "<tr><td>" + orderDetail.Rows[loopCount]["PRODUCT_NAME"] + "</td><td> " + price.ToString() + "</td><td>"
                    + orderDetail.Rows[loopCount]["QUANTITY"] + "</td><td> " + orderDetail.Rows[loopCount]["UNIT_AMOUNT"] + "</td> "
                +orderDetail.Rows[loopCount]["BUSINESS_ENTITY_NAME"] + "</td><td> " + orderDetail.Rows[loopCount]["PERSONAL_PHONE"] + "</td> </tr>";  
            }  
            textBody += "</table>";
            textBody += "<p style='" + "margin-top:30px;margin-bottom:30px;" + "'>For further details & queries call : 042-11111111111 </p>";
            body += textBody;

            SendEmail(destinationAddress, body);
            SendVendorEmail(OrderId, orderDate );
        }

        public static void SendEmail(string destinationAddress, string body) //command line function
        {
            MailMessage mail = new MailMessage("switchpak1122@gmail.com", destinationAddress); //function.
            SmtpClient client = new SmtpClient(); //protocol used for mail
            client.Port = 25;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;

            client.Host = "smtp.gmail.com";
            mail.Subject = "Food Chapter Order Placed";
            mail.Body = body;
            mail.IsBodyHtml = true;  
            //System.Net.Mail.Attachment attachment;
            //Thread.Sleep(5000);
            //attachment = new System.Net.Mail.Attachment(@"e:\Tasveeer.bmp");
            //mail.Attachments.Add(attachment);
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("switchpak1122@gmail.com", "switch@123.,");
            client.Send(mail);
        }
    }
}
