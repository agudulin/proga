/* wf_gcd_ga            Гудулин А.О.    26.09.2012
 * 
 * Простейшее приложение для Windows
 * Вычисление GCD(int m, int n)
 */

using System.Windows.Forms;

namespace wf_gcd_ga
{
    public partial class main_wf : Form
    {
        public main_wf()
        {
            InitializeComponent();
        }

        private void btn_getGcd_Click(object sender, System.EventArgs e)
        {
            int m, n;
            try
            {
                m = System.Convert.ToInt32(tb_inputM.Text);
                n = System.Convert.ToInt32(tb_inputN.Text);
                tb_gcd.Text = CalculateGCD(m, n).ToString();
            }
            catch
            {
                MessageBox.Show("Некорректно введены данные!");
            }
        }

        /*
         * @brief: GCD calculating
         */
        static int CalculateGCD(int m, int n)
        {
            m = (m < 0) ? -m : m;
            n = (n < 0) ? -n : n;
            return (n == 0) ? m : CalculateGCD(n, m % n);
        }

        private void tb_inputM_TextChanged(object sender, System.EventArgs e)
        {
            tb_gcd.Text = "";
        }

        private void tb_inputN_TextChanged(object sender, System.EventArgs e)
        {
            tb_gcd.Text = "";
        }

        private void aboutToolStripMenuItem_Click_1(object sender, System.EventArgs e)
        {
            about_wf about = new about_wf();
            about.ShowDialog();
        }
    }
}

