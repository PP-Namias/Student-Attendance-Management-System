   M S B A M L   `   `   `  ����_  [Student Attendance Management System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullU/clr-namespace:StudentAttendanceManagementSystem!StudentAttendanceManagementSystem  5   	   2    ,StudentAttendanceManagementSystem.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962ac _MaterialDesignThemes.MahApps, Version=1.0.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   5   	   =local/clr-namespace:StudentAttendanceManagementSystem   5   	     � Title$  
Login Page��5	   	   $	��450��5
   	   $	��800��5   	    � WindowStartupLocation$ CenterScreen=�5   	    � WindowStyle$
 None=�5   	    � 
ResizeMode$ NoResize=�5   	   .��5      � -   5        ��5   
   �� 5       �� 
StartPoint$ 0.1,0&�6"    �� EndPoint$ 0.9,1&�65   .��5      �  � Color$ #987554��6     � Offset$ 1Q�60   � 5      $ #1A120B��6    $ 0Q�60   5      .+�5   
   �� -   5        $	��390��5      $	��Top=�6    �� CornerRadius$ 	0 0 180 0��66   ���#1A120B._�5      �� $ ��/Images/bg effects (7).png��6   $��Uniform=�68   	 K� ZIndex$	 0��6J   $��
0,0,0,-227q�6[   5      �� 5   
   $��/OverlayLogHD.png��6   $��Uniform=�6+   $	 0��6=   $��-10,0,0,-71q�6N   �� 5   
   
 �� Orientation$
 
Horizontal=�6   .+�5      �� $	��350��6   .+�5      �� $��Student Attendance��6   
������� �� TextAlignment$ Center=�5       $��25(�5!      $��Century Gothic)�5"      $��Center=�68   $��0,11,0,0q�6U   �� 5#      $��Management System��6   
�������$ Center=�5%      $��25(�5&      $��Century Gothic)�5'      $��Center=�68   �� 5(      $��/SapiensBrown.png��6   $	��352��64   $	��341��6@   $��
-10,3,0,30q�6M   $��Uniform=�6a   $	 4��6s   5)      �� 5*      $	��390��6   .+�5+      �� $��20 40q�6   $	��348��6,   .+�5,      �� $��Login��6    $��20q�5-       
�������$ Center=�5/       $��38(�50       $��Century Gothic)�51       $	��347��6<   6J   �� 54      $
 
Horizontal=�6!   $��10,33,10,10q�6:   $	��289��6O   .+�55      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$
 User=�62   $��25��6>   $��25��6I   
�������6U   �� 56      -   5         ��Name$ txtUsername��56   "   $
��10 0q�67   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Enter Username��6E   
�������$	��250��6�   
������� �� 
CaretBrush �#3C2A21 �� SelectionBrush �#3C2A21���	#00000000$��Century)�6�   57      �� 5:      $
 
Horizontal=�6!   $��21,14,10,10q�6:   $	��300��6O   .+�5;        $
 Lock=�62   $��25��6>   $��25��6I   
�������6U   �� 5=      -   5        $ txtPasswordTextBox��5=   "   $
��10 0q�6>   $��0��6L   $y�Hidden=�6V   $��1��6j   $ Enter Password��6w   
�������
������� �#3C2A21 �#3C2A21���	#00000000$��Century)�6  6Q  G� 5?      -   5         G�Name$ txtPassword��5?   &   $��-10 0q�6;   $	��250��6J   $��2��6V   $ Enter Password��6c   
�������
������� G� 
CaretBrush �#3C2A21 G� SelectionBrush �#3C2A21 G� Password$  ��6�   $��Century)�6�   6+  5B      �� 5D      -   5         ��Name$ btnShowPassword��5E   2    &  "MaterialDesignFloatingActionButton#��[  5D      ���	#FF001011 � ToolTip$ Show/Hide Password��5E      ���	#FFD5CEA3$��30��6�   $��30��6�   $��316,-50,0,0q�6�   .��5F        -   5          Name$ iconShowPassword��5F   2   $
 Hide=�6L   
�������$��18��6k   $��18��6v   5G      �� 5J      $��	0,50,0,50q�6!   $��Center=�64   .+�5K      �� -   5        $ btnLogin��5K   !   $ Login��5L   !   ���#453424
�������+  %MaterialDesignThemes.Wpf.ButtonAssist   CornerRadius$ 25��5P   !   $��20(�5R   !   $	��175��5S   !   $��50��5T   !   $��Center=�5U   !    � Cursor$
 Hand��5V   !   $��0q�5W   !   $��Century Gothic)�5X   !   $
��Bold"�5Y   !   $��0q�5[   !   $��	40,-3,0,0q�6-   .��5]      � $��Center=�6(   .+�5^   "     $ Login=�5_   %   $��30��5`   %   $��30��5a   %   �� 5b   "   $��| Login��6,   $��Center=�5c   $   $��SemiBold"�5d   $   $	��0 0q�5e   $   5f      5g      5h      �� 5l      $��130 -74 0 34q�6!   $��Center=�67   �� 5o      $��0,0,0,10q�6!   $��Center=�63   �� 5r      $��0 0 0 0q�6!   $��Center=�62   5u      5v      �� 5w      $��-70,-380,0,0q�6   $	��145��6/   $
 
Horizontal=�6;   $��Center=�6T   .+�5x      �� -	   5        $ btnMinimize��5y   (   $��20 30q�5x      #��[  6(   $ Minimize��5y      ���	#FFD5CEA3$��35��6o   $��35��6z   ��5x   d   Z� .��5z        $ Minimize=�6.   
�������$��20��6Q   $��20��6\   5{      �� 5|      -
   5        $ btnExit��5}   %   $
��0 20q�5|      #��[  6'   $ Close��5}      ���	#FFD5CEA3$��35��6d   $��35��6o   ��5|   c   Z� .��5~        $ Close=�6.   
�������$��20��6N   $��20��6Y   5      5�      5�      5�      5�      