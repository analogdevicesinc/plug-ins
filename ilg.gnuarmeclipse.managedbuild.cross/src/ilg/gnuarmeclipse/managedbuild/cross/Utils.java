package ilg.gnuarmeclipse.managedbuild.cross;

import org.eclipse.cdt.managedbuilder.core.IBuildObject;
import org.eclipse.cdt.managedbuilder.core.IConfiguration;
import org.eclipse.cdt.managedbuilder.core.IFileInfo;
import org.eclipse.cdt.managedbuilder.core.IFolderInfo;
import org.eclipse.cdt.managedbuilder.core.IHoldsOptions;
import org.eclipse.cdt.managedbuilder.core.IResourceInfo;
import org.eclipse.cdt.managedbuilder.core.IToolChain;

public class Utils {

	public static String BUILD_ARTEFACT_TYPE = "org.eclipse.cdt.build.core.buildArtefactType";
	public static String BUILD_ARTEFACT_TYPE_EXE = BUILD_ARTEFACT_TYPE + ".exe";
	public static String BUILD_ARTEFACT_TYPE_STATICLIB = BUILD_ARTEFACT_TYPE
			+ ".staticLib";

	private static final String PROPERTY_OS_NAME = "os.name"; //$NON-NLS-1$

	public static boolean isPlatform(String sPlatform) {
		return (System.getProperty(PROPERTY_OS_NAME).toLowerCase()
				.startsWith(sPlatform));
	}

	/**
	 * Extracts a resource info from a build object. If no resource info can be
	 * found, it returns null.
	 * 
	 * @param configuration
	 * @return
	 */
	public static IResourceInfo getResourceInfo(IBuildObject configuration) {
		if (configuration instanceof IFolderInfo)
			return (IFolderInfo) configuration;
		if (configuration instanceof IFileInfo)
			return (IFileInfo) configuration;
		if (configuration instanceof IConfiguration)
			return ((IConfiguration) configuration).getRootFolderInfo();
		return null;
	}

	public static IConfiguration getConfiguration(IBuildObject configuration) {
		if (configuration instanceof IFolderInfo)
			return ((IFolderInfo) configuration).getParent();
		if (configuration instanceof IFileInfo)
			return ((IFileInfo) configuration).getParent();
		if (configuration instanceof IConfiguration)
			return (IConfiguration) configuration;
		return null;
	}

	public static IConfiguration getConfiguration(IHoldsOptions holder) {
		if (holder instanceof IToolChain)
			return ((IToolChain) holder).getParent();
		return null;
	}

}
