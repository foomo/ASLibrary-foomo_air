package org.foomo.air.utils
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

	public class FileUtil
	{
		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @param filename File to remove if exists
		 */
		public static function rm(filename:String):void
		{
			var file:File = File.applicationStorageDirectory.resolvePath(filename);
			if (file.exists) file.deleteFile();
		}

		/**
		 * @param object Object to serialize to file
		 * @param filename File name to serialize to
		 * @return The given object to serialize
		 */
		public static function serialize(object:*, filename:String):*
		{
			var file:File = File.applicationStorageDirectory.resolvePath(filename);
			var fileStream:FileStream = new FileStream();
			fileStream.open(file, FileMode.WRITE);
			fileStream.writeObject(object);
			fileStream.close();
			return object;
		}

		/**
		 * @param filename File to unserialize
		 * @return Unserialized file
		 */
		public static function unserialize(filename:String):*
		{
			var file:File = File.applicationStorageDirectory.resolvePath(filename);
			if (!file.exists) return null;
			var obj:Object;
			var fileStream:FileStream = new FileStream();
			fileStream.open(file, FileMode.READ);
			obj = fileStream.readObject();
			fileStream.close();
			return obj;
		}
	}
}