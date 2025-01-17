﻿#pragma checksum "..\..\StudentAttendance.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "350F574C8E88AEB8CABCF07404B2B5B60FEBF576E3778C3E2CB706169CF93B45"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using MahApps.Metro;
using MahApps.Metro.Accessibility;
using MahApps.Metro.Actions;
using MahApps.Metro.Automation.Peers;
using MahApps.Metro.Behaviors;
using MahApps.Metro.Controls;
using MahApps.Metro.Controls.Dialogs;
using MahApps.Metro.Converters;
using MahApps.Metro.Markup;
using MahApps.Metro.Theming;
using MahApps.Metro.ValueBoxes;
using MaterialDesignThemes.MahApps;
using MaterialDesignThemes.Wpf;
using MaterialDesignThemes.Wpf.Converters;
using MaterialDesignThemes.Wpf.Transitions;
using StudentAttendanceManagementSystem;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace StudentAttendanceManagementSystem {
    
    
    /// <summary>
    /// StudentAttendance
    /// </summary>
    public partial class StudentAttendance : System.Windows.Controls.UserControl, System.Windows.Markup.IComponentConnector {
        
        
        #line 42 "..\..\StudentAttendance.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Grid UserPages;
        
        #line default
        #line hidden
        
        
        #line 46 "..\..\StudentAttendance.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Grid topgrid;
        
        #line default
        #line hidden
        
        
        #line 54 "..\..\StudentAttendance.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock WelcomeMessage;
        
        #line default
        #line hidden
        
        
        #line 64 "..\..\StudentAttendance.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ScrollViewer mainscrollviewer;
        
        #line default
        #line hidden
        
        
        #line 96 "..\..\StudentAttendance.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button AttendanceEntry;
        
        #line default
        #line hidden
        
        
        #line 106 "..\..\StudentAttendance.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BarcodeScanner;
        
        #line default
        #line hidden
        
        
        #line 116 "..\..\StudentAttendance.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button ButtonPurchaseSelling2;
        
        #line default
        #line hidden
        
        
        #line 119 "..\..\StudentAttendance.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Documents.Run PrintStudentAttendanceListReport;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/Student Attendance Management System;component/studentattendance.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\StudentAttendance.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.UserPages = ((System.Windows.Controls.Grid)(target));
            return;
            case 2:
            this.topgrid = ((System.Windows.Controls.Grid)(target));
            return;
            case 3:
            this.WelcomeMessage = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 4:
            this.mainscrollviewer = ((System.Windows.Controls.ScrollViewer)(target));
            return;
            case 5:
            this.AttendanceEntry = ((System.Windows.Controls.Button)(target));
            
            #line 96 "..\..\StudentAttendance.xaml"
            this.AttendanceEntry.Click += new System.Windows.RoutedEventHandler(this.AttendanceEntry_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.BarcodeScanner = ((System.Windows.Controls.Button)(target));
            
            #line 106 "..\..\StudentAttendance.xaml"
            this.BarcodeScanner.Click += new System.Windows.RoutedEventHandler(this.BarcodeScanner_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            this.ButtonPurchaseSelling2 = ((System.Windows.Controls.Button)(target));
            
            #line 116 "..\..\StudentAttendance.xaml"
            this.ButtonPurchaseSelling2.Click += new System.Windows.RoutedEventHandler(this.PrintAttendance_Click);
            
            #line default
            #line hidden
            return;
            case 8:
            this.PrintStudentAttendanceListReport = ((System.Windows.Documents.Run)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}

