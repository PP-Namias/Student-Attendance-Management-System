   M S B A M L   `   `   `  ����D  @LoginPage, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:LoginPage	LoginPage  5   	       LoginPage.Login   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962ac _MaterialDesignThemes.MahApps, Version=1.0.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   5   	   %localclr-namespace:LoginPage   5   	     � Title$  
Login Page��5	   	   $	��450��6   $	��800��6)    � WindowStartupLocation$ CenterScreen=�65    � WindowStyle$
 None=�6Z    � 
ResizeMode$ NoResize=�6m   .��5
      � -   5        ��5   
   �� 5       �� 
StartPoint$ 0.1,0&�6"    �� EndPoint$ 0.9,1&�65   .��5      �  � Color$ #093A3E��6     � Offset$ 1Q�60   � 5      $ #3AAFB9��6    $ 0Q�60   5      .+�5   
   �� -   5        $	��390��5      $	��Top=�6    �� CornerRadius$ 	0 0 180 0��66   ���#0010115      �� 5   
   	 �� Orientation$	 
Horizontal=�6   .+�5      �� $	��400��6   .+�5      �� $��Student Attendance��6   
�������
 �� TextAlignment$
 Center=�5      $��30(�5      $��Century)�5      $��0,20,0,0q�61   5      �� 5      $��Management System��6   
�������$
 Center=�5      $��30(�5      $��Century)�5      5       �� 5!      $G��AThe Student Attendance Management System is designed to modernize��6   
�������$
 Center=�5#      $��10(�5$      $��Century)�5%      $��0,10,0,0q�61   5&      �� 5'      $C��= the attendance tracking process in educational institutions.��6   
�������$
 Center=�5)      $��10(�5*      $��Century)�5+      5,      �� 5-      $��/Images/mike.jpg��6   $	��250��63   $	��269��6?   $��30q�6L   $��Uniform=�6X   5.      �� 5/      $	��375��6   .+�50      �� $��20 40q�6   $	��350��6,   .+�51      �� $��
Login Page��6    $��20q�62   
�������$
 Center=�52       $��38(�67   $��Century)�6F   6]   �� 53      $	 
Horizontal=�6!   $��10q�6:   .+�54      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$
 User=�62   $��25��6>   $��25��6I   
�������6U   �� 55      -   5         ��Name$ txtUsername��55   "   $
��10 0q�67   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Enter Username��6E   
�������$	��250��6�   
������� �� 
CaretBrush �#093A3E �� SelectionBrush �#093A3E���	#00000000$��Century)�6�   56      �� 59      $	 
Horizontal=�6!   $��10q�6:   $	��380��6F   .+�5:        $
 Lock=�62   $��25��6>   $��25��6I   
�������6U   �� 5<      -   5        $ txtPasswordTextBox��5<   "   $
��10 0q�6>   $��0��6L   $y�Hidden=�6V   $��1��6j   $ Enter Password��6w   
�������
������� �#093A3E �#093A3E���	#00000000$��Century)�6  G� 5>      -   5         G�Name$ txtPassword��5>   &   $��-10 0q�6;   $	��250��6J   $��2��6V   $ Enter Password��6c   
�������
������� G� 
CaretBrush �#093A3E G� SelectionBrush �#093A3E G� Password$  ��6�   $��Century)�6�   5@      �� 5B      -   5         ��Name$ btnShowPassword��5C   2    &  "MaterialDesignFloatingActionButton#��[  5B      ���	#FF001011 � ToolTip$ Show/Hide Password��5C      ���	#FF3AAFB9$��30��6�   $��30��6�   $��280,-50,0,0q�6�   .��5D        -   5          Name$ iconShowPassword��5D   2   $
 Hide=�6L   
�������$��18��6k   $��18��6v   5E      �� 5H      $��20 35 150 40q�6!   $��Center=�67   .+�5I      �� -   5        $ btnLogin��5K   Y   $	��100��5I   !   $��35��6-     MaterialDesignRaisedButton#��[ 69   +  %MaterialDesignThemes.Wpf.ButtonAssist   CornerRadius$ 10��5J   !   $��2q�6O   ���#093A3E$��Century)�6y   ���#093A3E
�������$ Login��5K   I   $��Login��6�   5L      �� 5P      $��130 -74 0 34q�6!   $��Center=�67   .+�5Q      �� -	   5        $ btnRegister��5S   `   $	��100��5Q   !   $��35��6-   #��[ 69   $ 10��5R   !   $��2q�6O   ���#093A3E$��Century)�6y   ���#093A3E
�������$ Registration��5S   I   $��Register��5T   ;   5V      5W      �� 5Z      $��0 0 0 34q�6!   $��Center=�63   .+�5[      �� -
   5        $ btnQRReader��5]   \   $	��125��5[   !   $��35��6-   #��[ 69   $ 10��5\   !   $��2q�6O   ���#093A3E$��Century)�6y   ���#093A3E
�������$ QRReader��5]   I   $��	QR Reader��5^   ;   5`      5a      5d      5e      �� 5f      $��-100,-380, 0, 0q�6   $	��145��62   $	 
Horizontal=�6>   $��Center=�6W   .+�5g      �� -   5        $ btnMinimize��5h   (   $��20 30q�5g      #��[  6(   $ Minimize��5h      ���	#FF3AAFB9$��35��6o   $��35��6z   ��5g   d   Z� .��5i        $ Minimize=�6.   
�������$��20��6Q   $��20��6\   5j      �� 5k      -   5        $ btnExit��5l   %   $
��0 20q�5k      #��[  6'   $ Close��5l      ���	#FF3AAFB9$��35��6d   $��35��6o   ��5k   c   Z� .��5m        $ Close=�6.   
�������$��20��6N   $��20��6Y   5n      5o      5p      5q      5r      