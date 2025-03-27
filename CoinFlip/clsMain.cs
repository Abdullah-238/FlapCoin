using System.Windows.Input;
using System.ComponentModel;

namespace CoinFlip
{
    public class clsMain : INotifyPropertyChanged
    {
        private Image _imageSource;

        public event PropertyChangedEventHandler? PropertyChanged;

        public int Face { get; set; }
        public int Tail { get; set; }


        public string lblTail { get; set; }

        public Image imgCoin
        {
            get => _imageSource;
            set
            {
                if (_imageSource != value)
                {
                    _imageSource = value;
                    OnPropertyChanged(nameof(ImageSource));
                }
            }
        }

        public ICommand Flip { get; set; }


        string _lblFace;

        public string lblFace
        {
            get => _lblFace;
            set
            {
                if (_lblFace != value)
                {
                    _lblFace = value;
                    OnPropertyChanged(nameof(String));
                }
            }
        }

        public clsMain()
        {
            Flip = new Command(Result);

            imgCoin = new Image();

            Face = 0; Tail = 0;

        }


        void Result()
        {
            Random random = new Random();

            int num = random.Next(1, 3);


            if (num == 1)
            {
                imgCoin.Source = "back.png";

                Face++;

                lblFace = Face.ToString();
            }
            else
            {
                imgCoin.Source = "front.png";

                Tail++;

                lblTail = Tail.ToString();
            }

        }

        async Task FlipUp(int y, int NumberOfFlipping)
        {

            for (int j = 0; j < NumberOfFlipping; j++)
            {

                await imgCoin.TranslateTo(0, y, 0, Easing.Linear);

                imgCoin.Source = "front.png";
                await imgCoin.RotateXTo(90, 100, Easing.Linear);

                imgCoin.Source = "back.png";
                await imgCoin.RotateXTo(180, 100, Easing.Linear);

                imgCoin.Source = "front.png";
                await imgCoin.RotateXTo(270, 100, Easing.Linear);

                imgCoin.Source = "back.png";
                await imgCoin.RotateXTo(360, 100, Easing.Linear);


                await imgCoin.RotateXTo(0, 0, Easing.Linear);

                y += -50;
            }
        }

        async Task FlipDown(int y, int NumberOfFlipping)
        {
            y += 50;

            for (int j = 0; j < NumberOfFlipping; j++)
            {

                await imgCoin.TranslateTo(0, y, 0, Easing.Linear);

                imgCoin.Source = "front.png";
                await imgCoin.RotateXTo(90, 100, Easing.Linear);

                imgCoin.Source = "back.png";
                await imgCoin.RotateXTo(180, 100, Easing.Linear);

                imgCoin.Source = "front.png";
                await imgCoin.RotateXTo(270, 100, Easing.Linear);

                imgCoin.Source = "back.png";
                await imgCoin.RotateXTo(360, 100, Easing.Linear);


                await imgCoin.RotateXTo(0, 0, Easing.Linear);


                y += 50;
            }
        }



        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
