import React from 'react';
import { Link } from 'react-router-dom';

const TermsAndCondition = () => {
    return (
        <div>
            <nav className="navbar navbar-expand-lg navbar-light text-white py-0 px-2" id="header">
                    <div className="container-fluid">
                        <Link className="navbar-brand fw-bold my-text-primary" to="#">
                            <img src={process.env.REACT_APP_LOGO} alt="" style={{ width: 60 }} />
                        </Link>
                        <button
                            className="navbar-toggler"
                            type="button"
                            data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent"
                            aria-expanded="false"
                            aria-label="Toggle navigation"
                        >
                            <span className="navbar-toggler-icon"></span>
                        </button>
                        <div className="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul className="navbar-nav ms-auto me-2 mb-2 mb-lg-0">
                                <li className="nav-item">
                                    <Link className="nav-link mx-md-3 active" to="/">
                                        Home
                                    </Link>
                                </li>
                                <li className="nav-item">
                                    <Link className="nav-link mx-md-3 active" to="/#our-services">
                                        Our Services
                                    </Link>
                                </li>
                                <li className="nav-item">
                                    <Link className="nav-link mx-md-3" to="/#how-it-works">
                                        How it Works
                                    </Link>
                                </li>
                                <li className="nav-item">
                                    <Link className="nav-link mx-md-3" to="privacy-policy">
                                        Privacy Policy
                                    </Link>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            <main>
                <section className="py-5 bg-light">
                    <h1 className="text-4xl font-bold text-center lg:text-5xl fw-bold">Terms of Service</h1>
                </section>
                <section className="container">
                    <div className="fw-normal lh-lg fs-5">
                        <div>
                            <p></p>
                            <div className="fw-bold">1. Terms</div>
                            <div className="mt-2 text-gray-800">
                                By accessing the {process.env.REACT_APP_NAME} website or mobile app, you are agreeing to be bound by these terms of service, all
                                applicable laws and regulations. You also agree that you are responsible for compliance with any applicable
                                local laws. If you do not agree with any of these terms, you are prohibited from using or accessing our
                                service. The materials contained in this website are protected by applicable copyright and trademark law.
                            </div>
                            <p></p>
                        </div>
                        <div>
                            <p></p>
                            <div className="fw-bold">2. Disclaimer</div>
                            <div className="mt-2 text-gray-800">
                                {process.env.REACT_APP_NAME} does not warrant or make any certainty concerning the accuracy, likely results, or reliability of
                                the use of the services on it's website or mobile app.
                            </div>
                            <p></p>
                        </div>
                        <div>
                            <p></p>
                            <div className="fw-bold">3. Accuracy of materials</div>
                            <div className="mt-2 text-gray-800">
                                The materials appearing on {process.env.REACT_APP_NAME}’s website or mobile app could include technical, typographical, or
                                photographic errors. {process.env.REACT_APP_NAME} does not warrant that any of the materials on its website are accurate,
                                complete or current. {process.env.REACT_APP_NAME} may make changes to the materials contained on its website at any time without
                                notice. However {process.env.REACT_APP_NAME} does not issue any commitment to update the materials.
                            </div>
                            <p></p>
                        </div>
                        <div>
                            <p></p>
                            <div className="fw-bold">3. Modifications</div>
                            <div className="mt-2 text-gray-800">
                                {process.env.REACT_APP_NAME} may revise these terms of service for its website or App at any time without notice. By using this
                                website you are agreeing to be bound by the then current version of these terms of service.
                            </div>
                            <p></p>
                        </div>
                        <div>
                            <p></p>
                            <div className="fw-bold">4. Governing Law</div>
                            <div className="mt-2 text-gray-800">
                                These terms and conditions are governed by and construed in accordance with the laws of Lagos state of
                                Nigeria and you irrevocably submit to the exclusive jurisdiction of the courts in that State or location.
                            </div>
                            <p></p>
                        </div>
                        <div>
                            <p></p>
                            <div className="fw-bold">5. Verification</div>
                            <div className="mt-2 text-gray-800">
                                You may not use the {process.env.REACT_APP_NAME} service under an unverified status, thus every account must certainly undergo a
                                moment of due process of BVN verification.
                                <ul className="ml-5 list-disc list-outside">
                                    <li>
                                        To ascertain that you’re matched properly, you may not exceed a maximum input of three wrong
                                        information.
                                    </li>
                                    <li>
                                        {process.env.REACT_APP_NAME} reserves the right to close every account with any wrong information, including accounts it
                                        deems suspicious.
                                    </li>
                                </ul>
                            </div>
                            <p></p>
                        </div>
                        <div>
                            <p></p>
                            <div className="fw-bold">6. Restriction</div>
                            <div className="mt-2 text-gray-800">
                                You may be restricted to conduct further services across our platforms if your account is suspected of any
                                fraudulent activity. However, customers may need to contact support with a strong evidence to retrieve
                                access to account, with a definite provision of security requirements.
                            </div>
                            <p></p>
                        </div>
                        <div>
                            <p></p>
                            <div className="fw-bold">6. User Type</div>
                            <div className="mt-2 text-gray-800">
                                Upon registration, users may provide information that evidence {process.env.REACT_APP_NAME} to access account type which may
                                vary between Users and Agents.
                                <ul className="ml-5 list-disc list-outside">
                                    <li>
                                        {process.env.REACT_APP_NAME} may require further information from agents specifically, including address, resident city
                                        and registration funds.
                                    </li>
                                </ul>
                            </div>
                            <p></p>
                        </div>
                        <div>
                            <p></p>
                            <div className="fw-bold">9. Transaction status</div>
                            <div className="mt-2 text-gray-800">
                                Transaction status may vary between different level of technical incompetencies from service providers or
                                unconfirmed actions.
                                <ul className="ml-5 list-disc list-outside">
                                    <li>
                                        Your transaction may fail upon any of the following circumstances; Pending, unconfirmed and
                                        declined.
                                    </li>
                                    <li>
                                        Affected users may contact support immediately for complaint or otherwise hold if transanction reads
                                        successful.
                                    </li>
                                </ul>
                            </div>
                            <p></p>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    );
};

export default TermsAndCondition;
