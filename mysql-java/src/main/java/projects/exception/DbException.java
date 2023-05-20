/**
 * 
 */
package projects.exception;

/**
 * @author Matt Johnson
 *
 */
@SuppressWarnings("serial")
public class DbException extends RuntimeException {

	/**
	 * 
	 */
	public DbException() {

	}

	/**
	 * @param message
	 */
	public DbException(String message) {
		super(message);
	
	}

	/**
	 * @param cause
	 */
	public DbException(Throwable cause) {
		super(cause);

	}

	/**
	 * @param message
	 * @param cause
	 */
	public DbException(String message, Throwable cause) {
		super(message, cause);
	
	}


	
}
