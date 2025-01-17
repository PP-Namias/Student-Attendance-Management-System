﻿#pragma checksum "..\..\SystemAdministration.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "FA4A08B2C8EE241ED8D3AB50C4BBDE0D01BE0431D920CF64F2A35BABAB1D0097"
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
    /// SystemAdministration
    /// </summary>
    public partial class SystemAdministration : System.Windows.Controls.UserControl, System.Windows.Markup.IComponentConnector {
        
        
        #line 42 "..\..\SystemAdministration.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Grid UserPages;
        
        #line default
        #line hidden
        
        
        #line 46 "..\..\SystemAdministration.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Grid topgrid;
        
        #line default
        #line hidden
        
        
        #line 54 "..\..\SystemAdministration.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock WelcomeMessage;
        
        #line default
        #line hidden
        
        
        #line 64 "..\..\SystemAdministration.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ScrollViewer mainscrollviewer;
        
        #line default
        #line hidden
        
        
        #line 95 "..\..\SystemAdministration.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button AddNewUserAccount;
        
        #line default
        #line hidden
        
        
        #line 105 "..\..\SystemAdministration.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button UserAccountManagement;
        
        #line default
        #line hidden
        
        
        #line 115 "..\..\SystemAdministration.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button SystemSettingsForm;
        
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
            System.Uri resourceLocater = new System.Uri("/Student Attendance Management System;component/systemadministration.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\SystemAdministration.xaml"
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
            this.AddNewUserAccount = ((System.Windows.Controls.Button)(target));
            
            #line 95 "..\..\SystemAdministration.xaml"
            this.AddNewUserAccount.Click += new System.Windows.RoutedEventHandler(this.AddNewUserAccount_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.UserAccountManagement = ((System.Windows.Controls.Button)(target));
            
            #line 105 "..\..\SystemAdministration.xaml"
            this.UserAccountManagement.Click += new System.Windows.RoutedEventHandler(this.UserAccountManagement_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            this.SystemSettingsForm = ((System.Windows.Controls.Button)(target));
            
            #line 115 "..\..\SystemAdministration.xaml"
            this.SystemSettingsForm.Click += new System.Windows.RoutedEventHandler(this.SystemSettingsForm_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

