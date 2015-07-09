import java.util.List;
import java.util.ArrayList;
import java.util.Scanner;
import java.io.FileNotFoundException;
import java.io.File;
import java.io.IOException;


public class PasswordCrack {

	private static ArrayList<String> dictionary, passwords;

	public static void main(String[] args) throws FileNotFoundException, IOException {
		String dict = args[0];
		String pw = args[1];

		dictionary = new ArrayList<String>(150);
		passwords = new ArrayList<String>(20);

		getLists(dict, pw);

		long startTime = System.nanoTime();

		for(String s: dictionary) {
			check(s);	
		}

		for(int i=1; passwords.size() > 0; i++)
			for(String s: dictionary) 
				mN(s, i);
			
		long endTime = System.nanoTime();
		long duration = (endTime - startTime);

		System.out.println("Elapsed time: " + (duration/1000000) + " miliseconds");
	}

	public static void getLists(String dict, String pw) throws FileNotFoundException, IOException {
		Scanner scdict = new Scanner(new File(dict));
		Scanner scpw = new Scanner(new File(pw));

		getPasswordList(scdict, scpw);
		// dictionary now has everyone's first and list names 
		// passwords now has all of the encrypted passwords (with salt appended to front) 
		addStringList(scdict);
		// dictionary now has everyone's first and last names as well as the dictionary
	}

	public static void addStringList(Scanner in) {
		while(in.hasNextLine()) {
			dictionary.add(in.nextLine().toLowerCase());
		}

		in.close();
	}

	public static void getPasswordList(Scanner scdict, Scanner scpw) {
		// first step is to add peoples' first and last names to the dictionary
		// second step is to add the encrypted passwords (and salt) to the password list
		String currentLine, firstLast;
		String[] split, splitName;

		while(scpw.hasNextLine()) {
			currentLine = scpw.nextLine();
			split = currentLine.split(":");	

			firstLast = split[4];	
			splitName = firstLast.split(" ");
			// assumption here is that someone has a space in between a first and last name.
			// could be changed should some weird case arise

			dictionary.add(splitName[0].toLowerCase());
			dictionary.add(splitName[1].toLowerCase());

			// add encrypted password to the list
			passwords.add(split[1]);
		}

		scpw.close();

	}

	public static String m(String s, int count) {
		String temp = "";

		//ascii val of 33 to 126 for the first 
		if(count <= 93)
			temp = prepend(s, (char)('!'+count)); 
		else if(count <= 186)
			temp = append(s, (char)('!'+count-93));
		else 
			switch(count-187){
				case 0: temp = removeFirst(s); break;
				case 1: temp = removeLast(s); break;
				case 2: temp = reverse(s); break;
				case 3: temp = duplicate(s); break;
				case 4: temp = reflect(s); break;
								// notice we have no lowercase(s) because everything is already lowercase (I converted the dictionary and peoples' names before adding them to the lists)
				case 5: temp = uppercase(s); break;
				case 6: temp = capitalize(s); break;
				case 7: temp = nCapitalize(s); break;
				case 8: temp = toggle1(s); break;
				case 9: temp = toggle2(s); break;
				default: System.out.println("count in m is too high " + count); break;
			}

		check(temp);
		return temp;

	}

	public static void mN(String previous, int timesToMangle) {
		if(timesToMangle > 0){
			for(int j=0; j<197; j++) {
				mN(m(previous, j), timesToMangle-1);
			}
		}
	}

	public static void check(String s) {
		// System.out.println(s);
		for(int i=0; i<passwords.size(); i++) {
			if(checkString(s, passwords.get(i))) {
				i--;

			}
		}
	}

	public static void checkFirst(String s) {
		for(int i=0; i<passwords.size(); i++) {
			if(checkString(s, passwords.get(i)))
				i--;
		}
	}

	public static boolean checkString(String s, String enc) {
		String salt = enc.substring(0, 2), encpw = enc;
		String check = jcrypt.crypt(salt, s);
		// jcrypt.crypt(salt, s) returns a String with encrypted password (with salt appended to front)

		if(encpw.equals(check)) {
			passwords.remove(check);	
			System.out.println("Match found: " + s + " matches encrypted password " + check + "\nRemoving from password list.");
			return true;
		}

		return false;
	}

	public static String prepend(String s, char a) {
		return a + s;
	}

	public static String append(String s, char a) {
		return s + a;
	}

	public static String removeFirst(String s) {
		return s.substring(1);
	}

	public static String removeLast(String s) {
		return s.substring(0, s.length()-1);
	}

	public static String reverse(String s) {
		String ret = "";

		for(int i=0; i<s.length(); i++)
			ret = s.charAt(i) + ret;	

		return ret;
	}

	public static String duplicate(String s) {
		return s + s;
	}

	public static String reflect(String s) {
		return s + reverse(s);
	}

	public static String uppercase(String s) {
		return s.toUpperCase();
	}

	// we don't need this because it's more efficient anyways to make all of the dictionary words lower case.
	public static String lowercase(String s) {
		return s.toLowerCase();
	}

	public static String capitalize(String s) {
		return Character.toUpperCase(s.charAt(0)) + s.substring(1).toLowerCase();
	}

	public static String nCapitalize(String s) {
		return Character.toLowerCase(s.charAt(0)) + s.substring(1).toUpperCase();
	}

	public static String toggle1(String s) {
		String ret = "";

		for(int i=0; i<s.length(); i++) {
			if(i%2==0)
				ret += Character.toUpperCase(s.charAt(i));
			else
				ret += s.charAt(i);
		}

		return ret;
	}

	public static String toggle2(String s) {
		String ret = "";

		for(int i=0; i<s.length(); i++) {
			if(i%2==1)
				ret += Character.toUpperCase(s.charAt(i));
			else
				ret += s.charAt(i);
		}

		return ret;
	}
}
