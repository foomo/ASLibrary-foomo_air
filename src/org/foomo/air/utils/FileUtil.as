package org.foomo.air.utils
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.ObjectEncoding;
	import flash.utils.ByteArray;

	public class FileUtil
	{
		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @param filename File to remove if exists
		 */
		public static function rm(path:String):void
		{
			var file:File = new File(path);
			if (file.exists) file.deleteFile();
		}

		/**
		 * @param sourcePath Path to file to copy
		 * @param destinationPath Path to file to copy to
		 * @param overwrite Overwrite existing file
		 * @return New file
		 */
		public static function copyTo(sourcePath:String, destinationPath:String, overwrite:Boolean=false):File
		{
			var source:File = new File(sourcePath);
			var destination:File = new File(destinationPath);
			source.copyTo(destination, overwrite);
			return destination;
		}

		/**
		 * @param sourcePath Path to file to copy
		 * @param destinationPath Path to file to copy to
		 * @param overwrite Overwrite existing file
		 * @return New file
		 */
		public static function copyToAsync(sourcePath:String, destinationPath:String, overwrite:Boolean=false):File
		{
			var source:File = new File(sourcePath);
			var destination:File = new File(destinationPath);
			source.copyToAsync(destination, overwrite);
			return destination;
		}

		/**
		 * @param path File url
		 * @param byteArray Data to store
		 * @return The created file
		 */
		public static function save(path:String, byteArray:ByteArray):File
		{
			var file:File = new File(path);
			var stream:FileStream = new FileStream();
			stream.open(file , FileMode.WRITE);
			stream.writeBytes(byteArray, 0, byteArray.length);
			stream.close();
			return file;
		}

		/**
		 * @param object Object to serialize to file
		 * @param filename File name to serialize to
		 * @return The given object to serialize
		 */
		public static function serialize(object:*, path:String, encoding:uint=3):*
		{
			var file:File = new File(path);
			var fileStream:FileStream = new FileStream();
			fileStream.objectEncoding = encoding;
			fileStream.open(file, FileMode.WRITE);
			fileStream.writeObject(object);
			fileStream.close();
			return object;
		}

		/**
		 * @param filename File to unserialize
		 * @return Unserialized file
		 */
		public static function unserialize(path:String, encoding:uint=3):*
		{
			var file:File = new File(path);
			if (!file.exists) return null;
			var obj:Object;
			var fileStream:FileStream = new FileStream();
			fileStream.objectEncoding = encoding;
			fileStream.open(file, FileMode.READ);
			obj = fileStream.readObject();
			fileStream.close();
			return obj;
		}
	}
}