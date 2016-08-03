using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Calculator
{
    public partial class Home : System.Web.UI.Page
    {
        //IV max possible
        private static List<string> pNames = new List<string>();
        private static List<string> pNamesSorted = new List<string>();

        private static Dictionary<string, int> pNamesIndex = new Dictionary<string, int>();

        //Dust requirements by level
        private Dictionary<int, int> dustByLevel = new Dictionary<int, int>() 
        { 
            {1, 200 },{2, 200 },
            {3, 400 },{4, 400 },
            {5, 600 },{6, 600 },
            {7, 800 },{8, 700 },
            {9, 1000 },{10, 1000 },
            {11, 1300 },{12, 1300 },
            {13, 1600 },{14, 1600 },
            {15, 1900 },{16, 1900 },
            {17, 2200 },{18, 2200 },
            {19, 2500 },{20, 2500 },
            {21, 3000 },{22, 3000 },
            {23, 3500 },{24, 3500 },
            {25, 4000 },{26, 4000 },
            {27, 4500 },{28, 4500 },
            {29, 5000 },{30, 5000 },
            {31, 6000 },{32, 6000 },
            {33, 7000 },{34, 7000 },
            {35, 8000 },{36, 8000 },
            {37, 9000 },{38, 9000 },
            {39, 10000 },{40, 10000 },
        };

        //CP Multiplier by level
        private Dictionary<int, double> cpMultiplierByLevel = new Dictionary<int, double>() 
        { 
            {1, 0.0940000 },{2, 0.1663979 },
            {3, 0.2157325 },{4, 0.2557201 },
            {5, 0.2902499 },{6, 0.3210876 },
            {7, 0.3492127 },{8, 0.3752356 },
            {9, 0.3995673 },{10, 0.4225000 },
            {11, 0.4431076 },{12, 0.4627984 },
            {13, 0.4816850 },{14, 0.4998584 },
            {15, 0.5173940 },{16, 0.5343543 },
            {17, 0.5507927 },{18, 0.5667545 },
            {19, 0.5822789 },{20, 0.5974000 },
            {21, 0.6121573 },{22, 0.6265671 },
            {23, 0.6406530 },{24, 3500 },
            {25, 0.6679340 },{26, 0.6811649 },
            {27, 0.6941437 },{28, 0.7068842 },
            {29, 0.7193991 },{30, 0.7317000 },
            {31, 0.7377695 },{32, 0.7437894 },
            {33, 0.7497610 },{34, 0.7556855 },
            {35, 0.7615638 },{36, 0.7673972 },
            {37, 0.7731865 },{38, 0.7789328 },
            {39, 0.7846370 },{40, 0.7903000 },
        };

        //Atack
        private List<int> pAttack = new List<int>() 
        { 
            126,156,198,128,160,212,112,144,186,62,56,144,68,62,144,94,126,
            170,92,146,102,168,112,166,124,200,90,150,100,132,184,110,142,
            204,116,178,106,176,98,168,88,164,134,162,202,122,162,108,172,108,
            148,104,156,132,194,122,178,156,230,108,132,180,110,150,186,118,
            154,198,158,190,222,106,170,106,142,176,168,200,110,184,128,186,
            138,126,182,104,156,124,180,120,196,136,172,204,90,104,162,116,
            178,102,150,110,232,102,140,148,138,126,136,190,110,166,40,164,
            142,122,176,112,172,130,194,154,176,172,198,214,184,148,42,192,
            186,110,114,186,192,238,156,132,180,148,190,182,180,198,232,242,
            128,170,250,284,220       
        };

        //Defense
        private List<int> pDefense = new List<int>() 
        {
            126,158,200,108,140,182,142,176,222,66,86,144,64,82,130,90,122,
            166,86,150,78,146,112,166,108,154,114,172,104,136,190,94,128,170,
            124,178,118,194,54,108,90,164,130,158,190,120,170,118,154,86,140,
            94,146,112,176,96,150,110,180,98,132,202,76,112,152,96,144,180,78,
            110,152,136,196,118,156,198,138,170,110,198,138,180,132,96,150,
            138,192,110,188,112,196,82,118,156,186,140,196,110,168,124,174,
            132,164,150,202,172,204,160,142,198,116,160,60,152,178,100,150,
            126,160,128,192,196,180,134,160,158,186,184,84,196,190,110,128,
            168,174,178,158,160,202,142,190,162,180,242,194,194,110,152,212,
            202,220
        };

        //Stamina
        private List<int> pStamina = new List<int>() 
        { 
            90,120,160,78,116,156,88,118,158,90,100,120,80,90,130,80,126,166,
            60,110,80,130,70,120,70,120,100,150,110,140,180,92,122,162,140,190,
            76,146,230,280,80,150,90,120,150,70,120,120,140,20,70,80,130,100,
            160,80,130,110,180,80,130,180,50,80,110,140,160,180,100,130,160,80,
            160,80,110,160,100,130,180,190,50,100,104,70,120,130,180,160,210,60,
            100,60,90,120,70,120,170,60,110,80,120,120,190,100,120,100,100,180,
            80,130,160,210,500,130,210,60,110,90,160,60,120,80,140,130,130,130,
            130,150,40,190,260,96,110,260,130,130,130,70,140,60,120,160,320,180,
            180,180,82,122,182,212,200
        };
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Populate pNmaes & Sort
                int k = 0;
                foreach (ListItem i in pokemonDDL.Items)
                {
                    pNames.Add(i.ToString());
                    pNamesIndex.Add(i.ToString(), k);
                    k++;
                }
                pNamesSorted = pNames;
                pNamesSorted.Sort();

                //pStats DDL filled
                pStatsDDL.DataSource = pNamesSorted;
                pStatsDDL.DataBind();
            }
        }

       

        protected void pokemonDDLSelection_Change(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(hpTextBox.Text.Trim()) && !string.IsNullOrEmpty(cpTextBox.Text.Trim()))
                resultLabel.Text = "PERFECT: " + calculateIV(pokemonDDL.SelectedItem.ToString(), Convert.ToInt32(cpTextBox.Text.Trim()),
                    Convert.ToInt32(hpTextBox.Text.Trim()), Convert.ToInt32(trainerLevelDDL.SelectedItem.ToString()), pokemonDDL.SelectedIndex);
        }

        protected void trainerLevelDDLSelection_Change(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(hpTextBox.Text.Trim()) && !string.IsNullOrEmpty(cpTextBox.Text.Trim()))
                resultLabel.Text = "PERFECT: " + calculateIV(pokemonDDL.SelectedItem.ToString(), Convert.ToInt32(cpTextBox.Text.Trim()),
                    Convert.ToInt32(hpTextBox.Text.Trim()), Convert.ToInt32(trainerLevelDDL.SelectedItem.ToString()), pokemonDDL.SelectedIndex);
        }

        protected void poweredDDLSelection_Change(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(hpTextBox.Text.Trim()) && !string.IsNullOrEmpty(cpTextBox.Text.Trim()))
                resultLabel.Text = "PERFECT: " + calculateIV(pokemonDDL.SelectedItem.ToString(), Convert.ToInt32(cpTextBox.Text.Trim()),
                    Convert.ToInt32(hpTextBox.Text.Trim()), Convert.ToInt32(trainerLevelDDL.SelectedItem.ToString()), pokemonDDL.SelectedIndex);
        }

        //Calculate the IV
        string calculateIV(string pokemonName, int CP, int HP, int trainerLevel, int pIndex)
        {
            StringBuilder toReturn = new StringBuilder();
            double bestHP;
            double bestCP;
            double perfect = 0;

            double atkIV = 0;
            double defIV = 0;
            double stamIV = 0;

            if (!string.IsNullOrEmpty(hpTextBox.Text.Trim()) && !string.IsNullOrEmpty(cpTextBox.Text.Trim()))
            {
                //Calcualte the IV Value

                //Best HP & CP
                atkIV = 15;
                defIV = 15;
                stamIV = 15;
                bestHP = Math.Round((pStamina[pIndex] + stamIV) * cpMultiplierByLevel[trainerLevel]);
                bestCP = Math.Round((pAttack[pIndex] + atkIV) * (double)Math.Pow(pDefense[pIndex] + defIV, 0.5)
                    * (double)Math.Pow(pStamina[pIndex] + stamIV, 0.5) * (double)Math.Pow(cpMultiplierByLevel[trainerLevel], 2) / 10);

                //Calculate Average



                perfect = (((HP / bestHP) + (CP / bestCP)) / 2) * 100;

                if (perfect > 100)
                    perfect = 100;
            }

            return (perfect.ToString("#.0") + "%");
        }


        //Max Stats
        protected void pStatsDDLSelection_Change(object sender, EventArgs e)
        {
            StringBuilder maxStats = new StringBuilder();
            
            //Check selected
            foreach (string s in pNames)
                if (s == pStatsDDL.SelectedItem.ToString())
                {
                    maxStats.Append("<b>" + "Pokemon" + ":</b> ").Append(s).Append("</br>");
                    maxStats.Append("&nbsp;&nbsp;&nbsp;&nbsp;<b>" + "Attack" + ":</b> ").Append(pAttack[pNamesIndex[pStatsDDL.SelectedItem.ToString()]]).Append("</br>");
                    maxStats.Append("&nbsp;&nbsp;&nbsp;&nbsp;<b>" + "Defense" + ":</b> ").Append(pDefense[pNamesIndex[pStatsDDL.SelectedItem.ToString()]]).Append("</br>");
                    maxStats.Append("&nbsp;&nbsp;&nbsp;&nbsp;<b>" + "Stamina" + ":</b> ").Append(pStamina[pNamesIndex[pStatsDDL.SelectedItem.ToString()]]).Append("</br>");
                }

            maxStatsLabel.Text = maxStats.ToString();
        }
    }
}