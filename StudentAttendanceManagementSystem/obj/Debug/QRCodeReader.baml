   M S B A M L   `   `   `  ����_  [Student Attendance Management System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullU/clr-namespace:StudentAttendanceManagementSystem!StudentAttendanceManagementSystem  5   	   4    .StudentAttendanceManagementSystem.QRCodeReader   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962ac _MaterialDesignThemes.MahApps, Version=1.0.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   5   	   =local/clr-namespace:StudentAttendanceManagementSystem   5   	   -   5        $��0q�5
   	     � Title$  QR/Bar Code Reader��5   	   $	��780��6$   $
��1290��61    � WindowStartupLocation$ CenterScreen=�6>    � WindowStyle$
 None=�6c    � 
ResizeMode$ NoResize=�6v   .��5      �  � ColumnDefinitions 5   
   �� 5      $��975.976 �6   �� 5      $��334.024 �6   ��5   
   �� 5       �� 
StartPoint$ 0.1,0&�6"    �� EndPoint$ 0.9,1&�65   .��5      �  � Color$ #093A3E��6     � Offset$ 1Q�60   � 5      $ #3AAFB9��6    $ 0Q�60   5      .+�5   
   �� $��2��6   $��0,0,26,0q�6%   .+�5      �� -   5        	 ��Name$	 
videoFrame��5      $��/Images/Screen View.png��6(   $
��Left=�6I   $	��504��6d   $	��Top=�6q   $	��892��6�   
 J� RenderTransformOrigin$
 0.5,0.5&�6�   $��Uniform=�6�    �� Left$ 9��6�   
 �� Top$ 11��6�   z�5      V� 5      .~�5      ��  �� ScaleY$ 1Q�6)    �� ScaleX$ 1Q�64   T� 5       5!      5#      �� 5&      -   5         ��Name$ QRTextBlock��5&      $��30(�6.   $
��Left=�6<   $
��Wrap=�6X   $��Waiting for 2D Bar-code..��6l   $��Center=�6�   $��39��6�   $	��892��6�   $ 10��6�   $	 516��6�   $��Century Gothic)�6�   $
��Bold"�6�   �� 5'      -   5        $ FrameCounterTextBlock��5'      $��20(�68   $
��Wrap=�6G   $��Frames recorded: 0��6[   $	��Top=�6u   $��39��6�   $	��315��6�   $ 10��6�   $	 555��6�   $��Century Gothic)�6�   $��Center=�6�   $
��Bold"�6   �� 5(      -   5        $ QRCounterTextBlock��5(      $��20(�65   $
��Wrap=�6D   $��BAR/QR codes decoded: 0��6X   $	��Top=�6w   $��40��6�   $	��381��6�   $	 375��6�   $	 555��6�   $
��Left=�6�   $��Century Gothic)�6�   $
��Bold"�6  �� 5*      -   5         ��Name$ StartStopButton��5*      ���	#FF093A3E$��
Start/Stop��6E   $��25(�6Z   $��Center=�6h   $	��Top=�6�   $	��200��6�   $��88��6�   $��Center=�6�    � Cursor$
 Hand��6�   $ 30��6  $	 657��6  ���	#FF001011$��Century Gothic)�6>  �� 5,      -   5        $ 
helpButton��5,      ���	#FF093A3E$
��Bold"�6@   $��45(�6R   $��Center=�6`   $	��Top=�6~   $��94��6�   $��88��6�   $��Center=�6�   $��?��6�   $
 Hand��6�   $	 775��6  $	 657��6  ���	#FF001011$��Century Gothic)�6=  �� 5.      -   5        $ camSwitchButton��5.       �� 	ClickMode$ Release=�6.   ���	#FF093A3E$��25(�6\   $��Center=�6j   $	��Top=�6�   $	��200��6�   $��88��6�   $��Center=�6�   $��
Switch Cam��6�   $
 Hand��6  $	 275��6  $	 657��6-  ���	#FF001011$��Century Gothic)�6V  �� 5/      -	   5        $ recordButton��5/      $
��Bold"�6+   $��45(�6=   $
��Left=�6K   $	��Top=�6g   $	��176��6   $��88��6�   $��Center=�6�   $�� ��6�   $
 Hand��6�   $	 512��6�   $	 657��6�   ���	#FF001011��50      �� 51       �� ImageSource$ /Images/recording.png��6!    j� Stretch$ UniformToFill=�6E    �� RelativeTransform 52      V� 53      .~�54   "   ��  �� CenterY$	 0.5Q�61    �� CenterX$	 0.5Q�6?   �� 55   "    �� CenterY$	 0.5Q�60    �� CenterX$	 0.5Q�6>   �� 56   "    �� CenterY$	 0.5Q�62    �� CenterX$	 0.5Q�6@   T� 57   "   58      5:      5<      �� 5>      -
   5         ��Name$ 	camsLabel��5>      $��Camera information��6'   $��Center=�6D   $	��Top=�6b   $	��591��6z   $��58��6�   $��30(�6�   $ 10��6�   $	 575��6�   $��Century Gothic)�6�   $
��Bold"�6�   �� 5?      ���#3C2A21$	��598��6.   $	 914��6;   $ 80��6M   $	��358��6]   $��Center=�6i   $	��Top=�6�   .+�5A      �� 
���   �$��2q�6-   $
��Left=�6A   $	��310��6\   $��	25,25,0,0q�6i   $	��Top=�6|   $	��310��6�   ._�5B      �� -   5        $	 
imgProfile��5B      $��Center=�60   $	��300��6M   $��Center=�6Z   $	��300��6u   $��/Images/malkist photo.jpg��6�   $
 Hand��6�   $��UniformToFill=�6�   5C      �� 5E      -   5        $ txtName��5E      $��Center=�6-   $��0,10,0,0q�6J   $
��Wrap=�6\   $.��(Malkist Sugar Flavoured Cracker Biscuits��6p   $	��Top=�6�   $��Century Gothic)�6�   $��75��6�   $	��310��6�   $��30(�6�    �� TextAlignment$ Center=�6�   �� 5G      -   5        $ lblDate��5G      $��Date:��6)   $
��Left=�69   $��25,0,0,0q�6T   $��Century Gothic)�6f   $��50��6�   $��90��6�   $��30(�6�   �� 5H      -   5        $ txtDate��5H      $
��Wrap=�6-   $��
80,-45,0,0q�6A   $
��Date��6U   $��Century Gothic)�6a   $��50��6}   $	��215��6�   $��30(�6�   �� 5I      -   5        $ lblTime��5I      $��Time:��6)   $
��Left=�69   $��25,0,0,0q�6T   $��Century Gothic)�6f   $��50��6�   $��90��6�   $��30(�6�   �� 5J      -   5        $ txtTime��5J      $
��Wrap=�6-   $��
80,-45,0,0q�6A   $
��Time��6U   $��Century Gothic)�6a   $��50��6}   $	��215��6�   $��30(�6�   �� 5K      -   5        $ 
btnRefresh��5M   K   $��44��5K         MaterialDesignRaisedButton#��[  6%   +  %MaterialDesignThemes.Wpf.ButtonAssist   CornerRadius$ 10��5L      $��2q�6?   ���#093A3E$��Century)�6j   ���#093A3E
������� � ToolTip$ Refresh��5M   9   $��Refresh��5N   *   $	��180��6<   5Q      5R      �� 5T   
   $	��145��6     �� Orientation$  
Horizontal=�6!   $	��Top=�6:   $��Right=�6R   $��1��6n   .+�5U      �� -   5        $ btnMinimize��5V   (   $��20 30q�5U       & "MaterialDesignFloatingActionButton#��[ 6$   $ Minimize��5V      ���	#FF3AAFB9$��35��6o   $��35��6z   ��5U   `   Z� .��5W      '  !MaterialDesignThemes.Wpf.PackIcon  !   Kind$! Minimize=�6*   
�������$��20��6M   $��20��6X   5X      �� 5Y      -   5        $ btnExit��5Z   %   $
��0 20q�5Y      #��[ 6#   $ Close��5Z      ���	#FF3AAFB9$��35��6d   $��35��6o   ��5Y   _   Z� .��5[        $! Close=�6*   
�������$��20��6J   $��20��6U   5\      5]      5^      5`      