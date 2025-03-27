
using CoinFlip;
using CommunityToolkit.Maui.Animations;
using MediaManager;
using Microsoft.Maui.Controls.PlatformConfiguration;
using Plugin.Maui.Audio;
using System;
using System.Diagnostics;
using System.Globalization;
using System.Media;


namespace CoinFlip
{
    public partial class MainPage : ContentPage
    {

        public IAudioManager _audioManager;

        int Face = 0, Tail = 0;

        public MainPage(IAudioManager audioManager)
        {
            InitializeComponent();

            imgCoin.Source = "front.png";

            var currentCulture = CultureInfo.CurrentCulture;

            if (CultureInfo.CurrentCulture.Name.StartsWith("ar"))
            {
                btnFlip.Text = "اقلب العملة";
                lblFaceHeader.Text = "صورة : ";
                lblTailHeader.Text = "كتابة : ";
            }

            this._audioManager = audioManager;
        }

        private async void Button_Clicked(object sender, EventArgs e)
        {

            var Player = _audioManager.CreatePlayer(await FileSystem.OpenAppPackageFileAsync("coinflippingsoun.wav"));


            Player.Play();

            btnFlip.IsEnabled = false;

            int y = -50, NumberOfFlipping = 5;

            await FlipUp( y, NumberOfFlipping);

            await FlipDown(-250, NumberOfFlipping);

            Result();
        }


        void Result()
        {
            Random random = new Random();

            int num = random.Next(1, 3);


            if (num == 1)
            {
                imgCoin.Source = "back.png";

                Face++;

                lblFace.Text = Face.ToString();
            }
            else
            {
                imgCoin.Source = "front.png";

                Tail++;

                lblTail.Text = Tail.ToString();
            }

            btnFlip.IsEnabled = true;
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

        async Task FlipDown(int y,int NumberOfFlipping)
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
       

    }

}


