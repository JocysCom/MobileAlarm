using Android.Bluetooth;
using System;
using System.Collections.Generic;
using System.Text;

namespace JocysCom.MobileAlarm.Server
{
	public class BluetoothDeviceReceiverEventArgs: EventArgs
	{
		public BluetoothDevice Device { get; set; }
	}
}
