   M S B A M L   `   `   `  ����_  [Student Attendance Management System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullU/clr-namespace:StudentAttendanceManagementSystem!StudentAttendanceManagementSystem  5   	   ;    5StudentAttendanceManagementSystem.AddStudentsDatabase   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962ac _MaterialDesignThemes.MahApps, Version=1.0.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   5   	   =local/clr-namespace:StudentAttendanceManagementSystem   5   	     � Title$  Registration��5	   	   $	��450��6   $	��800��6+    � WindowStartupLocation$ CenterScreen=�67    � WindowStyle$
 None=�6\    � 
ResizeMode$ NoResize=�6o   .��5
      � -   5        ��5   
   �� 5       �� 
StartPoint$ 0.1,0&�6"    �� EndPoint$ 0.9,1&�65   .��5      �  � Color$ #987554��6     � Offset$ 1Q�60   � 5      $ #1A120B��6    $ 0Q�60   5      .+�5   
   �� -   5        $	��390��5      $	��Top=�6    �� CornerRadius$ 	0 0 180 0��66   ���#1A120B5      �� 5   
   	 �� Orientation$	 
Horizontal=�6   .+�5      �� $	��350��6   .+�5      �� $��/Images/SapiensBrown.png��6   $	��290��6;   $	��323��6G   $��30q�6T   $��Uniform=�6`   5      �� 5      $	��375��6   .+�5      �� $	��425��6   $��0,10,0,0q�6*   .+�5      �� $��Add Student Data��6    $��20q�68   
�������
 �� TextAlignment$
 Center=�5       $��38(�67   $��Century Gothic)�6F   6d   �� 5      $	 
Horizontal=�6!   $��10q�6:   .+�5      �� -   5         ��Name$ txtUsername��5   "   $��	50,0,10,0q�67   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ 
Enter Name��6J   
�������$	��250��6�   
������� �� 
CaretBrush �#987554 �� SelectionBrush �#987554$��Century Gothic)�6�   5      �� 5      $	 
Horizontal=�6!   $��10q�6:   .+�5       �� -   5         ��Name$ cmbRo1le��5    #   $��	50,0,10,0q�65   $ Select Course��6H   
�������$	��250��6�   
�������$��Century Gothic)�6�   ���#1A120B � 	Resources 5!       �� 
TargetType �� Property �� Value��%X   '��       �� 5"   "   " ��6(   .�5#   &   ��  � �� �#1A120B6C   5$   #   5%      .@�5&      �� ���#1A120B$
��BSCS��6@   �� 5'      ���#1A120B$
��BSIT��6@   �� 5(      ���#1A120B$
��BSIS��6@   �� 5)      ���#1A120B$��BSEMC��6@   5*      5+      �� 5-      $	 
Horizontal=�6!   $��10q�6:   .+�5.      �� -   5        $ 	cmbRoa1le��5.   #   $��	50,0,10,0q�66   $ Select Year��6I   
�������$	��250��6�   
�������$��Century Gothic)�6�   ���#1A120B 5/      ��%X   '��       �� 50   "   " ��6(   .�51   &   ��  � �� �#1A120B6C   52   #   53      .@�54      �� ���#1A120B$��1��6@   �� 55      ���#1A120B$��2��6@   �� 56      ���#1A120B$��3��6@   �� 57      ���#1A120B$��4��6@   58      59      �� 5;      $	 
Horizontal=�6!   $��10q�6:   .+�5<      �� -   5        $ 
cmbRaoa1le��5<   #   $��	50,0,10,0q�67   $ Select Section��6J   
�������$	��250��6�   
�������$��Century Gothic)�6�   ���#1A120B 5=      ��%X   '��       �� 5>   "   " ��6(   .�5?   &   ��  � �� �#1A120B6C   5@   #   5A      .@�5B      �� ���#1A120B$��A��6@   �� 5C      ���#1A120B$��B��6@   �� 5D      ���#1A120B$��C��6@   �� 5E      ���#1A120B$��D��6@   5F      5G      �� 5I      $	 
Horizontal=�6!   $��10q�6:   .+�5J      G� -   5         G�Name$ txtConformPassword��5J   &   $��	50,0,10,0q�6B   $ Enter Student Id��6U   
�������$	��250��6�   
������� G� 
CaretBrush �#987554 G� SelectionBrush �#987554$��Century Gothic)�6�   5K      �� 5O      $��
50 25 0 30q�6!   $
��Left=�65   .+�5P      �� -   5         ��Name$ btnRegister��5R   S   $	��120��5P   !   $��46��6-      MaterialDesignRaisedButton#��[  69   +  %MaterialDesignThemes.Wpf.ButtonAssist   CornerRadius$ 10��5Q      $��2q�6C   ���#987554$��Century Gothic)�6n   ���#987554
������� � ToolTip$ Add Student��5R   =   $��Add Student��5S   /    J� RenderTransformOrigin$ 0.5,0.5&�6E   $��Center=�6e   $��80,0,0,0q�6�   z�5T      V� 5U   "   .~�5V   &   �� �� 5W   &   �� 5X   &    �� Angle$ -0.721Q�66   T� 5Y   &   5Z   #   5\      5]      5`      5a      �� 5c      $��-50,-380, 0, 0q�6   $	��145��61   $	 
Horizontal=�6=   $��Center=�6V   .+�5d      �� -	   5        $ btnMinimize��5e   (   $��20 30q�5d       & "MaterialDesignFloatingActionButton#��[ 6(   $ Minimize��5e      ���	#FF1A120B$��35��6o   $��35��6z   ��5d   d   Z� .��5f      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Minimize=�6.   
�������$��20��6Q   $��20��6\   5g      �� 5h      -
   5        $ btnExit��5i   %   $
��0 20q�5h      #��[ 6'   $ Close��5i      ���	#FF1A120B$��35��6d   $��35��6o   ��5h   c   Z� .��5j        $ Close=�6.   
�������$��20��6N   $��20��6Y   5k      5l      5m      �� 5p   
   $��
70 210 1 1q�6   $��Center=�6)   �� 5s   
   $��380 320 0 30q�6   $��Center=�6,   5w      5x      