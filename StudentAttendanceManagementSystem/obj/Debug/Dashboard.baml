   M S B A M L   `   `   `  ����U  QLiveCharts.Wpf, Version=0.9.7.0, Culture=neutral, PublicKeyToken=0bc1f845d1ebb8dfG4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.WpfLiveCharts.Wpf  5      _ [Student Attendance Management System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullU/clr-namespace:StudentAttendanceManagementSystem!StudentAttendanceManagementSystem 5      1   +StudentAttendanceManagementSystem.Dashboard   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962ac _MaterialDesignThemes.MahApps, Version=1.0.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   5      @lvc4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.Wpf   5      =local/clr-namespace:StudentAttendanceManagementSystem   5      -   5        ���#3C2A21$	��785��5      $
��1125��5      .��5      � ���#3C2A21  � ColumnDefinitions  5   
   �� 5      $��8* �6   �� 5      $��4* �6    � 	Resources 5   
   '  !MaterialDesignThemes.Wpf.PackIcon �� 
TargetType �� Property �� Value��%�   '        �� 5      "  6   .�5      ��  � ��$ 30��6*   67   �� 5       � ��$ 30��6+   68   5      5      .+�5   
   �� $!��/Images/bg effects (13).png��6   $��UniformToFill=�65   � 5   
   $��0��6   .+�5!      �� $��10q�6   .+�5#      � $
��Left=�6   $��0,10,0,0q�67   .+�5&      #  MaterialDesignThemes.Wpf.Card  $��20,20,20,10q�6*   $��5q�6?      UniformCornerRadius$ 20Q�6K   $��Center=�6d   ���#1A120B���#E5E5CB.��5'      � $��10q�6$   .+�5(           Kind$ HandWave=�66   ���#FFC83D$��Center=�6[   $
��10 0q�6v   �� 5)      -   5         ��Name$ txtName��5)   (   $
��10 0q�69   $��Center=�6G   $��SemiBold"�6b   $��16(�6x   	Welcome!!5+      5,      5-      �� 5/      -   5        $	 Day��5/       ���#E5E5CB$��35(�6C   $��Century Gothic)�6Q   $��	0,-20,0,0q�6m   $��Center=�6�   $��Center=�6�   �� 50      -   5        $
 Date��50       ���#E5E5CB$��25(�6C   $��Century Gothic)�6Q   $��-150,50,20,0q�6m   $��Center=�6�   $��Center=�6�   �� 51      -   5        $
 Time��51       ���#E5E5CB$��50(�6C   $��Century Gothic)�6Q   $��Center=�6�   $��Center=�6�   ��6m   �� *CurrentTime+6�   53      �� 54      $��2q�6    �� CornerRadius$ 15��6-   
�������$��
30,2,30,20q�6S   $	��650��6h   ._�55        $ 20Q�6*   ���#1A120B���#E5E5CB
�������$��0,8,0,0q�6�   $	��658��6�   $	��640��6�   $	��Top=�6�   .��56      �� $	��613��6%   $��Center=�62   .+�57      � .+�58   "   �� $��20,33,20,20q�6,   $
��Left=�6A   $��SemiBold"�6]   $
��Logs��6s   $��20(�6   �� 59   "   	 �� Orientation$	 
Horizontal=�6-   $��Right=�6F   $��0,0,21,0q�6b   .+�5:   &   �� $��
Attendance��60   $��Right=�6B   $��Center=�6^   $��SemiBold"�6y   $��14(�6�   $��5,0,5,0q�6�   �� 5;   &   $��	ExtraBold"�60   $��20(�6G   $	����6U   $��	wingdings)�6e   $��Center=�6|   ���#b99976$��0,0,20,0q�6�   $��Center=�6�   �� 5<   &   $��Login��60   $��Right=�6=   $��Center=�6Y   $��SemiBold"�6t   $��14(�6�   $��5,0,5,0q�6�   �� 5=   &   $��	ExtraBold"�60   $��20(�6G   $	����6U   $��	wingdings)�6e   $��Center=�6|   ���#ff9c4c$��0,0,20,0q�6�   $��Center=�6�   5>   #   5?      #   LiveCharts.Wpf.CartesianChart  5@      
���   �$��10,10,10,10q�6h   $	��251��6}   $	��Top=�6�   &    LiveCharts.Wpf.Charts.Base.Chart
   Series
 61   �� *SeriesCollection+   AxisX 5B   &      LiveCharts.Wpf.Axis     Title$ Dates��6/       LiveCharts.Wpf.DefaultAxes   CleanSeparator   	Separator# Z 6W      Labels 6=   �� *Labels+6W      AxisY 5E   &     $ Attendance Records��6/      LabelFormatter 6J   �� *	Formatter+5G        5I      
���   �$��10,10,10,10q�6q   $	��251��6�   $	��Top=�6�   
 61   �� *LoginLogsSeriesCollection+ 5K   &     $ Dates��6/   # Z 6`    6=   �� *LoginLogsLabels+6`    5N   &     $ 
Login Logs��6/    6B   �� *
Formatter2+5P      5R      5S      5T      5U      5V      �� 5W   
   $��1��6   ���#1A120B.+�5X      �� $ ��/Images/bg effects (8).png��6   $��UniformToFill=�68   $	��785��6P   $��
0,0,0,-785q�6]   �� 5n      $��Images/SapiensBrown.png��6   $��Uniform=�66   $��-20,100,0,20q�6H   $	��312��6^   $	��346��6k   � 5q       5s         CustomCalendarDayButton:  4System.Windows.Controls.Primitives.CalendarDayButton # MaterialDesignCalendarDayButton �� BasedOn-  'MaterialDesignThemes.Wpf.CalendarAssist  CustomCalendarButton7	  1System.Windows.Controls.Primitives.CalendarButton   MaterialDesignCalendarButton��%v  &	        7  &	 �     7  �� 5t      "  5v      8   .�5y      ��  �@ SelectionColor �#B2F39B5{      �� 5|        �@ SelectionForegroundColor
 �   �5~      5      �� 5�      " 	 5�      8   .�5�      ��  �@ SelectionColor �#B2F39B5�   !   �� 5�        �@ SelectionForegroundColor
 �   �5�   !   5�      5�      5�      � 5�      $��Center=�6   $��0,10,0,0q�65   .+�5�      �� -   5         ��Name$ StudentAttendance��5�      $��2q�64   $��10q�6H   $ 15��6T   
�������._�5�      �� $��10q�6!   ���#1A120B$	��130��6B   $	��110��6N   .+�5�      �� -   5        $ txtAttendance��5�   $   ���#E5E5CB$��SemiBold"�6P   $��40(�6f   $��69��6t   $��Center=�6~   �� 5�      ���#E5E5CB$��20(�69   $��Students��6G   $��Center=�6W   $
��Wrap=�6t   $��Center=�6�   �� 5�      ���#E5E5CB$��20(�69   $��
Attendance��6G   $��Center=�6Y   $
��Wrap=�6v   $��Center=�6�   5�      5�      �� 5�      -   5        $ StudentDatabase��5�      $��2q�62   $��10q�6F   $ 15��6R   
�������._�5�      �� $��10q�6!   ���#1A120B$	��130��6B   $	��110��6N   .+�5�      �� -	   5        $ txtDatabase��5�   $   ���#E5E5CB$��SemiBold"�6N   $��40(�6d   $��96��6r   $��Center=�6|   �� 5�      ���#E5E5CB$��20(�69   $��Students��6G   $��Center=�6W   $
��Wrap=�6t   $��Center=�6�   �� 5�      ���#E5E5CB$��20(�69   $��Database��6G   $��Center=�6W   $
��Wrap=�6t   $��Center=�6�   5�      5�      �� 5�      -
   5        $ 	LoginLogs��5�      $��2q�6,   $��10q�6@   $ 15��6L   
�������._�5�      �� $��10q�6!   ���#1A120B$	��130��6B   $	��110��6N   .+�5�      �� -   5        $ txtLoginLogs��5�   $   ���#E5E5CB$��SemiBold"�6O   $��40(�6e   $	��420��6s   $��Center=�6~   �� 5�      ���#E5E5CB$��20(�69   $��Login��6G   $��Center=�6T   $
��Wrap=�6q   $��Center=�6�   �� 5�      ���#E5E5CB$��20(�69   $
��Logs��6G   $��Center=�6S   $
��Wrap=�6p   $��Center=�6�   5�      5�      �� 5�      -   5        $ UserAccounts��5�      $��2q�6/   $��10q�6C   $ 15��6O   
�������._�5�      �� $��10q�6!   ���#1A120B$	��130��6B   $	��110��6N   .+�5�      �� -   5        $ txtAccounts��5�   $   ���#E5E5CB$��SemiBold"�6N   $��40(�6d   $	��420��6r   $��Center=�6}   �� 5�      ���#E5E5CB$��20(�69   $
��User��6G   $��Center=�6S   $
��Wrap=�6p   $��Center=�6�   �� 5�      ���#E5E5CB$��20(�69   $��Accounts��6G   $��Center=�6W   $
��Wrap=�6t   $��Center=�6�   5�      5�      5�      5�      5�      5�      