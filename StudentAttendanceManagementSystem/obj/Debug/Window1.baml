   M S B A M L   `   `   `  ����_  [Student Attendance Management System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullU/clr-namespace:StudentAttendanceManagementSystem!StudentAttendanceManagementSystem  5   	   /    )StudentAttendanceManagementSystem.Window1   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962ac _MaterialDesignThemes.MahApps, Version=1.0.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   5   	   =local/clr-namespace:StudentAttendanceManagementSystem   5   	     � Title$  Registration��5	   	   $	��450��6   $	��800��6+    � WindowStartupLocation$ CenterScreen=�67    � WindowStyle$
 None=�6\    � 
ResizeMode$ NoResize=�6o   .��5
      � -   5        ��5   
   �� 5       �� 
StartPoint$ 0.1,0&�6"    �� EndPoint$ 0.9,1&�65   .��5      �  � Color$ #987554��6     � Offset$ 1Q�60   � 5      $ #1A120B��6    $ 0Q�60   5      .+�5   
   �� -   5        $	��390��5      $	��Top=�6    �� CornerRadius$ 	0 0 180 0��66   ���#1A120B5      �� 5   
   	 �� Orientation$	 
Horizontal=�6   .+�5      �� $	��350��6   .+�5      �� $��/Images/SapiensBrown.png��6   $	��290��6;   $	��323��6G   $��30q�6T   $��Uniform=�6`   5      �� 5      $	��375��6   .+�5      �� $	��425��6   $��0,10,0,0q�6*   .+�5      �� $��Add User��6    $��-21,20,20,20q�60   
�������
 �� TextAlignment$
 Center=�5       $��38(�67   $��Century Gothic)�6F   6d   �� 5      $	 
Horizontal=�6!   $��10q�6:   .+�5      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$
 User=�62   $��25��6>   $��25��6I   
�������6U   �� 5      -   5         ��Name$ txtUsername��5   "   $
��10 0q�67   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Enter Username��6E   
�������$	��250��6�   
������� �� 
CaretBrush �#987554 �� SelectionBrush �#987554$��Century Gothic)�6�   5      �� 5       $	 
Horizontal=�6!   $��10q�6:   .+�5!        $ Phone=�62   $��25��6?   $��25��6J   
�������6V   �� 5"      -   5        $ txtPhoneNumber��5"   "   $
��10 0q�6:   $ Enter Phone Number��6H   
�������$	��250��6�   
������� �#987554 �#987554$��Century Gothic)�6  5#      �� 5%      $	 
Horizontal=�6!   $��10q�6:   .+�5&        $
 Lock=�62   $��25��6>   $��25��6I   
�������6U   G� 5'      -   5         G�Name$ txtPassword��5'   &   $
��10 0q�6;   $ Enter Password��6I   
�������$	��250��6�   
������� G� 
CaretBrush �#987554 G� SelectionBrush �#987554$��Century Gothic)�6�   5(      �� 5+      $	 
Horizontal=�6!   $��10q�6:   .+�5,        $
 Lock=�62   $��25��6>   $��25��6I   
�������6U   G� 5-      -   5        $ txtConformPassword��5-   &   $
��10 0q�6B   $ Confirm Password��6P   
�������$	��250��6�   
������� �#987554 �#987554$��Century Gothic)�6�   5.      �� 50      $	 
Horizontal=�6!   $��10q�6:   .+�51        $ UserConvert=�62   $��25��6E   $��25��6P   
�������6\   �� 52      -   5         ��Name$ cmbRole��52   #   $
��10 0q�64   $ Select Role��6B   
�������$	��250��6�   
�������$��Century Gothic)�6�   ���#1A120B � 	Resources 53       �� 
TargetType �� Property �� Value��%X   '��       �� 54   "   " ��6(   .�55   &   ��  � �� �#1A120B6C   56   #   57      .@�58      �� ���#1A120B$��Admin��6@   �� 59      ���#1A120B$��Teacher��6@   5:      5;      �� 5?      $��
50 25 0 30q�6!   $
��Left=�65   .+�5@      �� -   5         ��Name$ btnRegister��5B   T   $	��100��5@   !   $��44��6-      MaterialDesignRaisedButton#��[  69   +  %MaterialDesignThemes.Wpf.ButtonAssist   CornerRadius$ 10��5A      $��2q�6C   ���#987554$��Century Gothic)�6n   ���#987554
������� � ToolTip$ Registration��5B   =   $��Register��5C   /   $��
65,-10,0,0q�6B   5D      5G      5H      �� 5J      $��-50,-380, 0, 0q�6   $	��145��61   $	 
Horizontal=�6=   $��Center=�6V   .+�5K      �� -	   5        $ btnMinimize��5L   (   $��20 30q�5K       & "MaterialDesignFloatingActionButton#��[ 6(   $ Minimize��5L      ���	#FF1A120B$��35��6o   $��35��6z   ��5K   d   Z� .��5M        $ Minimize=�6.   
�������$��20��6Q   $��20��6\   5N      �� 5O      -
   5        $ btnExit��5P   %   $
��0 20q�5O      #��[ 6'   $ Close��5P      ���	#FF1A120B$��35��6d   $��35��6o   ��5O   c   Z� .��5Q        $ Close=�6.   
�������$��20��6N   $��20��6Y   5R      5S      5T      �� 5W   
   $��
70 210 1 1q�6   $��Center=�6)   �� 5Z   
   $��380 320 0 30q�6   $��Center=�6,   5^      5_      