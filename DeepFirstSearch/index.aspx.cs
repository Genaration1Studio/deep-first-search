using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace DeepFirstSearch
{
    public partial class index : System.Web.UI.Page
    {
        List<HtmlTableCell> tbCell = new List<HtmlTableCell>();

        int mode;
        int round;
        string s = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["round"] == null)
            {
                imgLoop.ImageUrl = "/images/2.png";
                imgTree.ImageUrl = "/images/Master.png";
                tb.Rows[0].Style.Add(HtmlTextWriterStyle.BackgroundColor, "#333333");
                tb.Rows[0].Style.Add(HtmlTextWriterStyle.TextAlign, "Center");
                for (int i = 1; i <= 15; i++)
                {
                    tb.Rows[i].Cells[0].Style.Add(HtmlTextWriterStyle.TextAlign, "Center");
                }
                for (int r = 1; r <= 15; r++)
                {
                    for (int c = 0; c < 2; c++)
                    {
                        tb.Rows[r].Cells[c].InnerHtml = "&nbsp;";
                    }
                }
            }
            if(Session["round"] != null)
            {

                txb_Search.Text = Session["node"].ToString();
                ddl_Mode.Items.FindByValue(Session["mode"].ToString()).Selected = true;
            }
        }

        protected void btn_Strat_ServerClick(object sender, EventArgs e)
        {
            if(check_form())
            {
 
                ddl_Mode.Enabled = false;
                txb_Search.Enabled = false;
                txb_Search.Text.Trim();

                String c = txb_Search.Text.Trim();
                switch (c)
                {
                    case "a": txb_Search.Text = "A"; break;
                    case "b": txb_Search.Text = "B"; break;
                    case "c": txb_Search.Text = "C"; break;
                    case "d": txb_Search.Text = "D"; break;
                    case "e": txb_Search.Text = "E"; break;
                    case "f": txb_Search.Text = "F"; break;
                    case "g": txb_Search.Text = "G"; break;
                    case "h": txb_Search.Text = "H"; break;
                    case "i": txb_Search.Text = "I"; break;
                    case "j": txb_Search.Text = "J"; break;
                    case "k": txb_Search.Text = "K"; break;
                    case "l": txb_Search.Text = "L"; break;
                    case "m": txb_Search.Text = "M"; break;
                    case "n": txb_Search.Text = "N"; break;
                    case "o": txb_Search.Text = "O"; break;
                }

                Session["node"] = txb_Search.Text;
                Session["mode"] = ddl_Mode.SelectedValue;

                if (Session["mode"].ToString() == "1")
                {
                    imgLoop.ImageUrl = "/images/1.gif";
                    btn_Next.Enabled = false ;
                    btn_Prev.Enabled = false;                                     
                    round = 1;
                    Session["round"] = round;
                    Timer1.Enabled = true;
                }
                else if (Session["mode"].ToString() == "2")
                {
                    imgLoop.ImageUrl = "/images/1.gif";
                    btn_Strat.Enabled = false;
                    btn_Next.Enabled = true;
                    round = 1;
                    Session["round"] = round;
                    searchNode();
                }  
            }         
        }

        protected void btn_Reset_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect(Request.RawUrl);
        }

        protected void btn_Next_ServerClick(object sender, EventArgs e)
        {
            if (Session["round"].ToString() == "2")
            {
                btn_Prev.Enabled = true;
            }
            searchNode();    
        }

        protected void btn_Prev_ServerClick(object sender, EventArgs e)
        {
            prevSearchNode();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            searchNode();
        }

        public void searchNode()
        {
            if(int.Parse(Session["round"].ToString()) <= 15)
            {
                if (int.Parse(Session["round"].ToString()) == 1)
                {
                    imgTree.ImageUrl = "/images/A.png";
                    tb.Rows[int.Parse(Session["round"].ToString())].Cells[0].InnerText = "A";
                    tb.Rows[int.Parse(Session["round"].ToString())].Cells[1].InnerText = "C B";
                }
                else
                {
                    if (int.Parse(Session["round"].ToString()) == 2)
                    {
                        imgTree.ImageUrl = "/images/B.png";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[0].InnerText = "B";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[1].InnerText = "C E D";
                    }
                    else if (int.Parse(Session["round"].ToString()) == 3)
                    {
                        imgTree.ImageUrl = "/images/D.png";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[0].InnerText = "D";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[1].InnerText = "C E I H";
                    }
                    else if (int.Parse(Session["round"].ToString()) == 4)
                    {
                        imgTree.ImageUrl = "/images/H.png";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[0].InnerText = "H";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[1].InnerText = "C E I";
                    }
                    else if (int.Parse(Session["round"].ToString()) == 5)
                    {
                        imgTree.ImageUrl = "/images/I.png";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[0].InnerText = "I";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[1].InnerText = "C E";
                    }
                    else if (int.Parse(Session["round"].ToString()) == 6)
                    {
                        imgTree.ImageUrl = "/images/E.png";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[0].InnerText = "E";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[1].InnerText = "C K J";
                    }
                    else if (int.Parse(Session["round"].ToString()) == 7)
                    {
                        imgTree.ImageUrl = "/images/J.png";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[0].InnerText = "J";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[1].InnerText = "C K";
                    }
                    else if (int.Parse(Session["round"].ToString()) == 8)
                    {
                        imgTree.ImageUrl = "/images/K.png";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[0].InnerText = "K";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[1].InnerText = "C";
                    }
                    else if (int.Parse(Session["round"].ToString()) == 9)
                    {
                        imgTree.ImageUrl = "/images/C.png";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[0].InnerText = "C";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[1].InnerText = "G F";
                    }
                    else if (int.Parse(Session["round"].ToString()) == 10)
                    {
                        imgTree.ImageUrl = "/images/F.png";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[0].InnerText = "F";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[1].InnerText = "G M L";
                    }
                    else if (int.Parse(Session["round"].ToString()) == 11)
                    {
                        imgTree.ImageUrl = "/images/L.png";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[0].InnerText = "L";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[1].InnerText = "G M";
                    }
                    else if (int.Parse(Session["round"].ToString()) == 12)
                    {
                        imgTree.ImageUrl = "/images/M.png";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[0].InnerText = "M";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[1].InnerText = "G";
                    }
                    else if (int.Parse(Session["round"].ToString()) == 13)
                    {
                        imgTree.ImageUrl = "/images/G.png";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[0].InnerText = "G";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[1].InnerText = "O N";
                    }
                    else if (int.Parse(Session["round"].ToString()) == 14)
                    {
                        imgTree.ImageUrl = "/images/N.png";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[0].InnerText = "N";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[1].InnerText = "O";
                    }
                    else if (int.Parse(Session["round"].ToString()) == 15)
                    {
                        imgTree.ImageUrl = "/images/O.png";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[0].InnerText = "O";
                        tb.Rows[int.Parse(Session["round"].ToString())].Cells[1].InnerText = "";
                    }
                }

               if (tb.Rows[int.Parse(Session["round"].ToString())].Cells[0].InnerText.Equals(txb_Search.Text.Trim()))
                {
                    imgLoop.ImageUrl = "/images/2.png";
                    Timer1.Enabled = false;
                    btn_Strat.Enabled = true;
                    btn_Next.Enabled = false;
                    btn_Prev.Enabled = false;
                    txb_Search.Enabled = true;
                    ddl_Mode.Enabled = true;
                    txb_Search.Focus();
                    Session.Abandon();
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "successnode('" + Session["node"].ToString()+"');", true);
                }
                else
                {
                    round = int.Parse(Session["round"].ToString());
                    round++;
                    Session["round"] = round;
                }

            }
            else
            {
                txb_Search.Enabled = true;
                ddl_Mode.Enabled = true;
                btn_Strat.Enabled = true;
                btn_Next.Enabled = false;
                btn_Prev.Enabled = false;
                Timer1.Enabled = false;            
                Session.Abandon();
                txb_Search.Focus();
                imgLoop.ImageUrl = "/images/2.png";
                for (int r = 1; r <= 15; r++)
                {
                    for (int c = 0; c < 2; c++)
                    {
                        tb.Rows[r].Cells[c].InnerHtml = "&nbsp;";
                    }
                }
                imgTree.ImageUrl = "images/Master.png";
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "falsenode('" + Session["node"].ToString() + "');", true);
            }          
        }

        public void prevSearchNode()
        {
            round = int.Parse(Session["round"].ToString());

            if (round-1 == 2) 
            {
                imgTree.ImageUrl = "/images/A.png";
                tb.Rows[round - 1].Cells[0].InnerHtml = "&nbsp;";
                tb.Rows[round - 1].Cells[1].InnerHtml = "&nbsp;";
                btn_Prev.Enabled = false;
            }
            else if (round-1 == 3) 
            {
                imgTree.ImageUrl = "/images/B.png";
                tb.Rows[round - 1].Cells[0].InnerHtml = "&nbsp;";
                tb.Rows[round - 1].Cells[1].InnerHtml = "&nbsp;";
            }
            else if (round-1 == 4)
            { 
                imgTree.ImageUrl = "/images/D.png";
                tb.Rows[round - 1].Cells[0].InnerHtml = "&nbsp;";
                tb.Rows[round - 1].Cells[1].InnerHtml = "&nbsp;";
            }
            else if (round-1 == 5) 
            {
                imgTree.ImageUrl = "/images/H.png";
                tb.Rows[round - 1].Cells[0].InnerHtml = "&nbsp;";
                tb.Rows[round - 1].Cells[1].InnerHtml = "&nbsp;";

            }
            else if (round-1 == 6) 
            {
                imgTree.ImageUrl = "/images/I.png";
                tb.Rows[round - 1].Cells[0].InnerHtml = "&nbsp;";
                tb.Rows[round - 1].Cells[1].InnerHtml = "&nbsp;";
            }
            else if (round-1 == 7) 
            {
                imgTree.ImageUrl = "/images/E.png";
                tb.Rows[round - 1].Cells[0].InnerHtml = "&nbsp;";
                tb.Rows[round - 1].Cells[1].InnerHtml = "&nbsp;";
            }
            else if (round-1 == 8) 
            {
                imgTree.ImageUrl = "/images/J.png";
                tb.Rows[round - 1].Cells[0].InnerHtml = "&nbsp;";
                tb.Rows[round - 1].Cells[1].InnerHtml = "&nbsp;";
            }
            else if (round-1 == 9) 
            {
                imgTree.ImageUrl = "/images/K.png";
                tb.Rows[round - 1].Cells[0].InnerHtml = "&nbsp;";
                tb.Rows[round - 1].Cells[1].InnerHtml = "&nbsp;";
            }
            else if (round-1 == 10) 
            {
                imgTree.ImageUrl = "/images/C.png";
                tb.Rows[round - 1].Cells[0].InnerHtml = "&nbsp;";
                tb.Rows[round - 1].Cells[1].InnerHtml = "&nbsp;";
            }
            else if (round-1 == 11)
            {
                imgTree.ImageUrl = "/images/F.png";
                tb.Rows[round - 1].Cells[0].InnerHtml = "&nbsp;";
                tb.Rows[round - 1].Cells[1].InnerHtml = "&nbsp;";
            }
            else if (round-1 == 12) 
            {
                imgTree.ImageUrl = "/images/L.png";
                tb.Rows[round - 1].Cells[0].InnerHtml = "&nbsp;";
                tb.Rows[round - 1].Cells[1].InnerHtml = "&nbsp;";
            }
            else if (round-1 == 13) 
            {
                imgTree.ImageUrl = "/images/M.png";
                tb.Rows[round - 1].Cells[0].InnerHtml = "&nbsp;";
                tb.Rows[round - 1].Cells[1].InnerHtml = "&nbsp;";
            }
            else if (round-1 == 14) 
            {
                imgTree.ImageUrl = "/images/G.png";
                tb.Rows[round - 1].Cells[0].InnerHtml = "&nbsp;";
                tb.Rows[round - 1].Cells[1].InnerHtml = "&nbsp;";
            }
            else if (round-1 == 15) 
            {
                imgTree.ImageUrl = "/images/N.png";
                tb.Rows[round - 1].Cells[0].InnerHtml = "&nbsp;";
                tb.Rows[round - 1].Cells[1].InnerHtml = "&nbsp;";
            }
            round--;
            Session["round"] = round;
        }

        public Boolean check_form()
        {
            bool tb = true;
            bool dl = true;
 
            if (txb_Search.Text == "")
            {
                txb_Search.Focus();
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "errorSearch();", true);
                tb = false;
            }
            else
            {
                tb = true;
            }

            if(ddl_Mode.SelectedValue == "0")
            {
                ddl_Mode.Focus();
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "errorMode();", true);
                dl = false;
            }
            else
            {
                dl = true; ;
            }

            if(tb == true && dl == true)
            {
                return true;
            }
            else
            {
                return false;
            }                    
        }
    }
}